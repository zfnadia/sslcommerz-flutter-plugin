/*
 * Created by Nadia Ferdoush on 18/09/2020.
 * Copyright (c) 2020. All rights reserved.
 */

package com.nadiaferdoush.sslcommerz_flutter_plugin;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * SslcommerzFlutterPlugin
 */
public class SslcommerzFlutterPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware,
        PluginRegistry.ActivityResultListener {
    private MethodChannel channel;
    private Activity activity;
    private Result pendingResult;
    static final int TRANSACTION_CODE = 2324;
    static final int TRANSACTION_SUCCESS_CODE = 0;
    static final int TRANSACTION_FAIL_CODE = 1;
    static final int MERCHANT_VALIDATION_ERROR_CODE = 2;
    static final int TRANSACTION_CANCELED_CODE = 3;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(),
                "sslcommerz_flutter_plugin");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("openSSLCommerz")) {
            pendingResult = result;
            HashMap<String, Object> valueMap = new HashMap<>();
            valueMap.put("sslCommerzInitialization", call.argument("sslCommerzInitialization"));
            valueMap.put("customerInfoInitializer", call.argument("customerInfoInitializer"));
            valueMap.put("emiTransactionInitializer", call.argument("emiTransactionInitializer"));
            valueMap.put("productInitializer", call.argument("productInitializer"));
            valueMap.put("shipmentInfoInitializer", call.argument("shipmentInfoInitializer"));
            valueMap.put("additionalInitializer", call.argument("additionalInitializer"));

            Intent intent = new Intent(activity, SSLCommerzActivity.class);
            intent.putExtra("valueMap", valueMap);
            activity.startActivityForResult(intent, TRANSACTION_CODE);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {

    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == TRANSACTION_CODE) {
            Map<String, Object> reply = new HashMap<>();
            reply.put("type", data.getIntExtra("type", -1));
            reply.put("data", data.getStringExtra("data"));
            pendingResult.success(reply);
        }
        return true;
    }
}