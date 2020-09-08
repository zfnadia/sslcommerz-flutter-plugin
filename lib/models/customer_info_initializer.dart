/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'customer_info_initializer.g.dart';

@JsonSerializable()
class CustomerInfoInitializer {
  String customerName;
  String customerEmail;
  String customerAddress1;
  String customerAddress2;
  String customerCity;
  String customerState;
  String customerPostCode;
  String customerCountry;
  String customerPhone;
  String customerFax;

  CustomerInfoInitializer(
      String customerName,
      String customerEmail,
      String customerAddress1,
      String customerCity,
      String customerPostCode,
      String customerCountry,
      String customerPhone,
      {String customerAddress2,
      String customerState,
      String customerFax}) {
    this.customerName = customerName;
    this.customerEmail = customerEmail;
    this.customerAddress1 = customerAddress1;
    this.customerCity = customerCity;
    this.customerPostCode = customerPostCode;
    this.customerCountry = customerCountry;
    this.customerPhone = customerPhone;
    this.customerAddress2 = customerAddress2;
    this.customerState = customerState;
    this.customerFax = customerFax;
  }

  factory CustomerInfoInitializer.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoInitializerToJson(this);
}
