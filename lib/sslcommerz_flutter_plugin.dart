/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'dart:convert';

import 'package:eventify/eventify.dart';
import 'package:flutter/services.dart';
import 'package:sslcommerz_flutter_plugin/models/additional_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/customer_info_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/product_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/sslc_transaction_info_model.dart';

import 'models/emi_transaction_initializer.dart';
import 'models/shipment_info_initializer.dart';
import 'models/sslc_initialization.dart';

class SslcommerzFlutterPlugin {
  // event names
  static const EVENT_TRANSACTION_SUCCESS = 'transactionSuccess';
  static const EVENT_TRANSACTION_FAIL = 'transactionFail';
  static const EVENT_MERCHANT_VALIDATION_ERROR = 'merchantValidationError';
  static const EVENT_TRANSACTION_CANCELED = 'transactionCanceled';

  // response codes
  static const TRANSACTION_SUCCESS_CODE = 0;
  static const TRANSACTION_FAIL_CODE = 1;
  static const MERCHANT_VALIDATION_ERROR_CODE = 2;
  static const TRANSACTION_CANCELED_CODE = 3;

  static const MethodChannel _channel =
      const MethodChannel('sslcommerz_flutter_plugin');

  // EventEmitter instance used for communication
  EventEmitter _eventEmitter;

  SslcommerzFlutterPlugin() {
    _eventEmitter = EventEmitter();
  }

  void integrateSSLCommerz(SSLCommerzInitialization sslCommerzInitialization,
      {CustomerInfoInitializer customerInfoInitializer,
      EMITransactionInitializer emiTransactionInitializer,
      ProductInitializer productInitializer,
      ShipmentInfoInitializer shipmentInfoInitializer,
      AdditionalInitializer additionalInitializer}) async {
    try {
      var response =
          await _channel.invokeMethod("openSSLCommerz", <String, Object>{
        'sslCommerzInitialization': jsonEncode(sslCommerzInitialization),
        'customerInfoInitializer': jsonEncode(customerInfoInitializer),
        'emiTransactionInitializer': jsonEncode(emiTransactionInitializer),
        'productInitializer': jsonEncode(productInitializer),
        'shipmentInfoInitializer': jsonEncode(shipmentInfoInitializer),
        'additionalInitializer': jsonEncode(additionalInitializer)
      });
      print("integrateSSLCommerz response");
      _handleResult(response);
    } on PlatformException catch (e) {
      print('SSLCommerz integration failed due to: ${e.message}');
    }
  }

  /// handles response from platform
  void _handleResult(Map<dynamic, dynamic> response) {
    print("_handleResult ${response["data"]}");
    String data = response["data"];

    switch (response['type']) {
      case TRANSACTION_SUCCESS_CODE:
        _eventEmitter.emit(EVENT_TRANSACTION_SUCCESS, null,
            SSLCTransactionInfoModel.fromJson(jsonDecode(data)));
        break;

      case TRANSACTION_FAIL_CODE:
        _eventEmitter.emit(EVENT_TRANSACTION_FAIL, null, data);
        break;

      case MERCHANT_VALIDATION_ERROR_CODE:
        _eventEmitter.emit(EVENT_MERCHANT_VALIDATION_ERROR, null, data);
        break;

      case TRANSACTION_CANCELED_CODE:
        _eventEmitter.emit(EVENT_TRANSACTION_CANCELED, null, data);
        break;

      default:
        _eventEmitter.emit(EVENT_TRANSACTION_CANCELED, null, data);
    }
  }

  /// registers event listeners for payment events
  void on(String event, Function handler) {
    EventCallback cb = (event, cont) {
      handler(event.eventData);
    };
    _eventEmitter.on(event, null, cb);
  }

  /// clears all event listeners
  void clear() {
    _eventEmitter.clear();
  }
}
