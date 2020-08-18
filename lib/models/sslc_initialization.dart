/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'sslc_initialization.g.dart';

@JsonSerializable()
class SSLCommerzInitialization {
  String store_id;
  String store_passwd;
  double total_amount;
  String currency;
  String tran_id;
  String product_category;
  String success_url;
  String fail_url;
  String cancel_url;
  String ipn_url;
  String multi_card_name;
  String allowed_bin;
  String sdkType;

  SSLCommerzInitialization(
      String store_id,
      String store_passwd,
      double total_amount,
      String currency,
      String tran_id,
      String product_category,
      String sdkType) {
    this.store_id = store_id;
    this.store_passwd = store_passwd;
    this.total_amount = total_amount;
    this.currency = currency;
    this.tran_id = tran_id;
    this.product_category = product_category;
    this.sdkType = sdkType;
  }

  String getSdkType() {
    return this.sdkType;
  }

  void setSdkType(String sdkType) {
    this.sdkType = sdkType;
  }

  String getSuccess_url() {
    return this.success_url;
  }

  void setSuccess_url(String success_url) {
    this.success_url = success_url;
  }

  String getFail_url() {
    return this.fail_url;
  }

  void setFail_url(String fail_url) {
    this.fail_url = fail_url;
  }

  String getCancel_url() {
    return this.cancel_url;
  }

  void setCancel_url(String cancel_url) {
    this.cancel_url = cancel_url;
  }

  String getStore_id() {
    return this.store_id;
  }

  void setStore_id(String store_id) {
    this.store_id = store_id;
  }

  String getStore_passwd() {
    return this.store_passwd;
  }

  void setStore_passwd(String store_passwd) {
    this.store_passwd = store_passwd;
  }

  double getTotal_amount() {
    return this.total_amount;
  }

  void setTotal_amount(double total_amount) {
    this.total_amount = total_amount;
  }

  String getCurrency() {
    return this.currency;
  }

  void setCurrency(String currency) {
    this.currency = currency;
  }

  String getTran_id() {
    return this.tran_id;
  }

  void setTran_id(String tran_id) {
    this.tran_id = tran_id;
  }

  String getProduct_category() {
    return this.product_category;
  }

  void setProduct_category(String product_category) {
    this.product_category = product_category;
  }

  String getIpn_url() {
    return this.ipn_url;
  }

  void setIpn_url(String ipn_url) {
    this.ipn_url = ipn_url;
  }

  String getMulti_card_name() {
    return this.multi_card_name;
  }

  void setMulti_card_name(String multi_card_name) {
    this.multi_card_name = multi_card_name;
  }

  String getAllowed_bin() {
    return this.allowed_bin;
  }

  void setAllowed_bin(String allowed_bin) {
    this.allowed_bin = allowed_bin;
  }

  SSLCommerzInitialization addIpnUrl(String ipn_url) {
    this.ipn_url = ipn_url;
    return this;
  }

  SSLCommerzInitialization addMultiCardName(String multi_card_name) {
    this.multi_card_name = multi_card_name;
    return this;
  }

  SSLCommerzInitialization addSAllowedBin(String allowed_bin) {
    this.allowed_bin = allowed_bin;
    return this;
  }

  factory SSLCommerzInitialization.fromJson(Map<String, dynamic> json) =>
      _$SSLCommerzInitializationFromJson(json);

  Map<String, dynamic> toJson() => _$SSLCommerzInitializationToJson(this);
}
