/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_json_widget/flutter_json_widget.dart';
import 'package:sslcommerz_flutter_plugin/constants.dart';
import 'package:sslcommerz_flutter_plugin/models/additional_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/product_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/shipment_info_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/sslc_initialization.dart';
import 'package:sslcommerz_flutter_plugin/models/sslc_transaction_info_model.dart';
import 'package:sslcommerz_flutter_plugin/sslcommerz_flutter_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTransactionSuccessful = false;
  String amount = '';
  var result;
  Map<String, dynamic> resultJsonObj;
  SslcommerzFlutterPlugin _sslcommerzFlutterPlugin;

  @override
  void initState() {
    super.initState();
    _sslcommerzFlutterPlugin = SslcommerzFlutterPlugin();
    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_TRANSACTION_SUCCESS, _transactionSuccess);
    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_TRANSACTION_FAIL, _transactionFail);
    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_MERCHANT_VALIDATION_ERROR,
        _merchantValidationError);
    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_TRANSACTION_CANCELED,
        _transactionCanceled);
  }

  @override
  Widget build(BuildContext context) {
    if (isTransactionSuccessful) {
      var resultJson = jsonEncode(result);
      resultJsonObj = jsonDecode(resultJson);
    }
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('SSLCommerz Plugin Example'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                  ),
                ),
                FlatButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    if (amount.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Amount can not be empty!",
                          backgroundColor: Colors.black,
                          textColor: Colors.white);
                    } else if (amount.isNotEmpty &&
                        double.parse(amount) <= 0.0) {
                      Fluttertoast.showToast(
                          msg: "Please enter valid amount",
                          backgroundColor: Colors.black,
                          textColor: Colors.white);
                    } else
                      initSSLCommerz(double.parse(amount));
                  },
                  child: Text(
                    "Initiate SSLCommerz",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                isTransactionSuccessful
                    ? Column(
                        children: <Widget>[
                          Text(
                            "Transaction status: Successful! \nSSLCommerz Transaction Info: ",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: JsonViewerWidget(resultJsonObj),
                          ),
                        ],
                      )
                    : result != null
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Transaction Status : $result',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ))
                        : Container(),
              ],
            ),
          )),
    );
  }

  void initSSLCommerz(double amount) async {
    try {
      _sslcommerzFlutterPlugin.integrateSSLCommerz(
          SSLCommerzInitialization(
              "yourStoreID",
              "yourPassword",
              amount,
              SSLCCurrencyType.BDT,
              "transactionID",
              "yourProductType",
              SSLCSdkType.TESTBOX),
          productInitializer: ProductInitializer.travelVertical(
            "food",
            'food',
            TravelVertical("Travel", "10", "A", "12", "Dhk-Syl"),
          ),
          shipmentInfoInitializer: ShipmentInfoInitializer("Courier", 2,
              ShipmentDetails("AA", "Address 1", "Dhaka", "1000", "BD")),
          additionalInitializer: AdditionalInitializer(
              valueA: "Value Option 1", valueB: "Value Option 2"));
    } catch (e) {
      debugPrint(e);
    }
  }

  void _transactionSuccess(SSLCTransactionInfoModel sslcTransactionInfoModel) {
    setState(() {
      isTransactionSuccessful = true;
      result = sslcTransactionInfoModel;
    });
  }

  void _transactionFail(String response) {
    setState(() {
      isTransactionSuccessful = false;
      result = response;
    });
  }

  void _merchantValidationError(String response) {
    setState(() {
      isTransactionSuccessful = false;
      result = response;
    });
  }

  void _transactionCanceled(String response) {
    setState(() {
      isTransactionSuccessful = false;
      result = response;
    });
  }
}
