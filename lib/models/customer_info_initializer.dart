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
      String customerPhone) {
    this.customerName = customerName;
    this.customerEmail = customerEmail;
    this.customerAddress1 = customerAddress1;
    this.customerCity = customerCity;
    this.customerPostCode = customerPostCode;
    this.customerCountry = customerCountry;
    this.customerPhone = customerPhone;
  }

  CustomerInfoInitializer addAddress2(String customerAddress2) {
    this.customerAddress2 = customerAddress2;
    return this;
  }

  CustomerInfoInitializer addState(String customerState) {
    this.customerState = customerState;
    return this;
  }

  CustomerInfoInitializer addFax(String customerFax) {
    this.customerFax = customerFax;
    return this;
  }

  String getCustomerName() {
    return this.customerName;
  }

  void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

  String getCustomerEmail() {
    return this.customerEmail;
  }

  void setCustomerEmail(String customerEmail) {
    this.customerEmail = customerEmail;
  }

  String getCustomerAddress1() {
    return this.customerAddress1;
  }

  void setCustomerAddress1(String customerAddress1) {
    this.customerAddress1 = customerAddress1;
  }

  String getCustomerAddress2() {
    return this.customerAddress2;
  }

  void setCustomerAddress2(String customerAddress2) {
    this.customerAddress2 = customerAddress2;
  }

  String getCustomerCity() {
    return this.customerCity;
  }

  void setCustomerCity(String customerCity) {
    this.customerCity = customerCity;
  }

  String getCustomerState() {
    return this.customerState;
  }

  void setCustomerState(String customerState) {
    this.customerState = customerState;
  }

  String getCustomerPostCode() {
    return this.customerPostCode;
  }

  void setCustomerPostCode(String customerPostCode) {
    this.customerPostCode = customerPostCode;
  }

  String getCustomerCountry() {
    return this.customerCountry;
  }

  void setCustomerCountry(String customerCountry) {
    this.customerCountry = customerCountry;
  }

  String getCustomerPhone() {
    return this.customerPhone;
  }

  void setCustomerPhone(String customerPhone) {
    this.customerPhone = customerPhone;
  }

  String getCustomerFax() {
    return this.customerFax;
  }

  void setCustomerFax(String customerFax) {
    this.customerFax = customerFax;
  }

  factory CustomerInfoInitializer.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoInitializerToJson(this);
}
