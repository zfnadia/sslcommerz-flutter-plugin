/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sslcommerz_flutter_plugin/constants.dart';
import 'package:sslcommerz_flutter_plugin/models/additional_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/customer_info_initializer.dart';
import 'package:sslcommerz_flutter_plugin/models/emi_transaction_initializer.dart';
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
  }

  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        result = "Amount can not be empty!";
                      });
                    } else if (amount.isNotEmpty &&
                        double.parse(amount) <= 0.0) {
                      setState(() {
                        result = "Please enter valid amount";
                      });
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Transaction Successful!",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.0),
                          Text("SSLCommerz Transaction Info: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                JsonEncoder.withIndent('  ').convert(result)),
                          ),
                        ],
                      )
                    : result != null
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(result,
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
              "bdjob5f0ad29f35834",
              "bdjob5f0ad29f35834@ssl",
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
          customerInfoInitializer: CustomerInfoInitializer(
              "Lucifer Morningstar",
              "lucy@g.com",
              "LAPD",
              "Los Angeles",
              "90001",
              "USA",
              "0000",
              customerAddress2: "N/A",
              customerFax: "90102",
              customerState: "LA"),
          emiTransactionInitializer: EMITransactionInitializer(0),
          shipmentInfoInitializer: ShipmentInfoInitializer("yes", 2,
              ShipmentDetails("AA", "Address 1", "Dhaka", "1000", "BD"),
              shipAddress2: "shipAddress2", shipState: "shipState"),
          additionalInitializer:
              AdditionalInitializer(valueA: "1", valueB: "2"));
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
}
