/*
 * Created by Nadia Ferdoush on 18/09/2020.
 * Copyright (c) 2020. All rights reserved.
 */

package com.nadiaferdoush.sslcommerz_flutter_plugin;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.google.gson.Gson;
import com.sslwireless.sslcommerzlibrary.model.initializer.SSLCAdditionalInitializer;
import com.sslwireless.sslcommerzlibrary.model.initializer.SSLCCustomerInfoInitializer;
import com.sslwireless.sslcommerzlibrary.model.initializer.SSLCEMITransactionInitializer;
import com.sslwireless.sslcommerzlibrary.model.initializer.SSLCProductInitializer;
import com.sslwireless.sslcommerzlibrary.model.initializer.SSLCShipmentInfoInitializer;
import com.sslwireless.sslcommerzlibrary.model.initializer.SSLCommerzInitialization;
import com.sslwireless.sslcommerzlibrary.model.response.SSLCTransactionInfoModel;
import com.sslwireless.sslcommerzlibrary.view.singleton.IntegrateSSLCommerz;
import com.sslwireless.sslcommerzlibrary.viewmodel.listener.SSLCTransactionResponseListener;

import java.util.HashMap;

import static com.nadiaferdoush.sslcommerz_flutter_plugin.SslcommerzFlutterPlugin.MERCHANT_VALIDATION_ERROR_CODE;
import static com.nadiaferdoush.sslcommerz_flutter_plugin.SslcommerzFlutterPlugin.TRANSACTION_CANCELED_CODE;
import static com.nadiaferdoush.sslcommerz_flutter_plugin.SslcommerzFlutterPlugin.TRANSACTION_FAIL_CODE;
import static com.nadiaferdoush.sslcommerz_flutter_plugin.SslcommerzFlutterPlugin.TRANSACTION_SUCCESS_CODE;
import static com.nadiaferdoush.sslcommerz_flutter_plugin.SslcommerzFlutterPlugin.TRANSACTION__CODE;

public class SSLCommerzActivity extends AppCompatActivity {

    boolean initialLaunchingDone = false;

    @Override
    protected void onResume() {
        super.onResume();
        if (initialLaunchingDone) {
            Intent intent = new Intent();
            intent.putExtra("type", TRANSACTION_CANCELED_CODE)
                    .putExtra("data", "Transaction Canceled");
            setResult(TRANSACTION__CODE, intent);
            finish();
            return;
        }
        initialLaunchingDone = true;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        final Gson gson = new Gson();
        Intent parentIntent = getIntent();
        @SuppressWarnings("unchecked")
        HashMap<String, Object> hashMap = (HashMap<String, Object>) parentIntent
                .getSerializableExtra("valueMap");

        // mandatory field to initialize SSLCommerz
        final SSLCommerzInitialization sslCommerzInitialization = gson.fromJson((String)
                hashMap.get("sslCommerzInitialization"), SSLCommerzInitialization.class);

        // optional fields to send additional data to SSLCommerz
        // customerInfoInitializer
        final SSLCCustomerInfoInitializer sslcCustomerInfoInitializer =
                gson.fromJson((String) hashMap.get("customerInfoInitializer"),
                        SSLCCustomerInfoInitializer.class);

        // emiTransactionInitializer
        final SSLCEMITransactionInitializer sslcemiTransactionInitializer =
                gson.fromJson((String) hashMap.get("emiTransactionInitializer"),
                        SSLCEMITransactionInitializer.class);

        // productInitializer
        final SSLCProductInitializer sslcProductInitializer =
                gson.fromJson((String) hashMap.get("productInitializer"),
                        SSLCProductInitializer.class);

        // shipmentInfoInitializer
        final SSLCShipmentInfoInitializer sslcShipmentInfoInitializer =
                gson.fromJson((String) hashMap.get("shipmentInfoInitializer"),
                        SSLCShipmentInfoInitializer.class);

        // additionalInitializer
        final SSLCAdditionalInitializer sslcAdditionalInitializer =
                gson.fromJson((String) hashMap.get("additionalInitializer"),
                        SSLCAdditionalInitializer.class);

        IntegrateSSLCommerz
                .getInstance(this)
                .addSSLCommerzInitialization(sslCommerzInitialization)
                .addCustomerInfoInitializer(sslcCustomerInfoInitializer)
                .addEMITransactionInitializer(sslcemiTransactionInitializer)
                .addProductInitializer(sslcProductInitializer)
                .addShipmentInfoInitializer(sslcShipmentInfoInitializer)
                .addAdditionalInitializer(sslcAdditionalInitializer)
                .buildApiCall(new SSLCTransactionResponseListener() {
                    @Override
                    public void transactionSuccess(SSLCTransactionInfoModel sslcTransactionInfoModel) {
                        String sslTransactionInfo = gson.toJson(sslcTransactionInfoModel);
                        Intent intent = new Intent();
                        intent.putExtra("type", TRANSACTION_SUCCESS_CODE)
                                .putExtra("data", sslTransactionInfo);
                        setResult(TRANSACTION__CODE, intent);
                        finish();
                    }

                    @Override
                    public void transactionFail(String s) {
                        Intent intent = new Intent();
                        intent.putExtra("type", TRANSACTION_FAIL_CODE)
                                .putExtra("data", s);
                        setResult(TRANSACTION__CODE, intent);
                        finish();
                    }

                    @Override
                    public void merchantValidationError(String s) {
                        Intent intent = new Intent();
                        intent.putExtra("type", MERCHANT_VALIDATION_ERROR_CODE)
                                .putExtra("data", s);
                        setResult(TRANSACTION__CODE, intent);
                        finish();
                    }
                });
    }

}
