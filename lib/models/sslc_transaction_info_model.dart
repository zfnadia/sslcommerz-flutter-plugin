/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'sslc_transaction_info_model.g.dart';

@JsonSerializable()
class SSLCTransactionInfoModel {
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'sessionkey')
  String sessionkey;
  @JsonKey(name: 'tran_date')
  String tranDate;
  @JsonKey(name: 'tran_id')
  String tranId;
  @JsonKey(name: 'val_id')
  String valId;
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'store_amount')
  String storeAmount;
  @JsonKey(name: 'bank_tran_id')
  String bankTranId;
  @JsonKey(name: 'card_type')
  String cardType;
  @JsonKey(name: 'card_no')
  String cardNo;
  @JsonKey(name: 'card_issuer')
  String cardIssuer;
  @JsonKey(name: 'card_brand')
  String cardBrand;
  @JsonKey(name: 'card_issuer_country')
  String cardIssuerCountry;
  @JsonKey(name: 'card_issuer_country_code')
  String cardIssuerCountryCode;
  @JsonKey(name: 'currency_type')
  String currencyType;
  @JsonKey(name: 'currency_amount')
  String currencyAmount;
  @JsonKey(name: 'currency_rate')
  String currencyRate;
  @JsonKey(name: 'base_fair')
  String baseFair;
  @JsonKey(name: 'value_a')
  String valueA;
  @JsonKey(name: 'value_b')
  String valueB;
  @JsonKey(name: 'value_c')
  String valueC;
  @JsonKey(name: 'value_d')
  String valueD;
  @JsonKey(name: 'risk_title')
  String riskTitle;
  @JsonKey(name: 'risk_level')
  String riskLevel;
  @JsonKey(name: 'APIConnect')
  String aPIConnect;
  @JsonKey(name: 'validated_on')
  String validatedOn;
  @JsonKey(name: 'gw_version')
  String gwVersion;

  SSLCTransactionInfoModel() {}

  String getStatus() {
    return this.status;
  }

  void setStatus(String status) {
    this.status = status;
  }

  String getSessionkey() {
    return this.sessionkey;
  }

  void setSessionkey(String sessionkey) {
    this.sessionkey = sessionkey;
  }

  String getTranDate() {
    return this.tranDate;
  }

  void setTranDate(String tranDate) {
    this.tranDate = tranDate;
  }

  String getTranId() {
    return this.tranId;
  }

  void setTranId(String tranId) {
    this.tranId = tranId;
  }

  String getValId() {
    return this.valId;
  }

  void setValId(String valId) {
    this.valId = valId;
  }

  String getAmount() {
    return this.amount;
  }

  void setAmount(String amount) {
    this.amount = amount;
  }

  String getStoreAmount() {
    return this.storeAmount;
  }

  void setStoreAmount(String storeAmount) {
    this.storeAmount = storeAmount;
  }

  String getBankTranId() {
    return this.bankTranId;
  }

  void setBankTranId(String bankTranId) {
    this.bankTranId = bankTranId;
  }

  String getCardType() {
    return this.cardType;
  }

  void setCardType(String cardType) {
    this.cardType = cardType;
  }

  String getCardNo() {
    return this.cardNo;
  }

  void setCardNo(String cardNo) {
    this.cardNo = cardNo;
  }

  String getCardIssuer() {
    return this.cardIssuer;
  }

  void setCardIssuer(String cardIssuer) {
    this.cardIssuer = cardIssuer;
  }

  String getCardBrand() {
    return this.cardBrand;
  }

  void setCardBrand(String cardBrand) {
    this.cardBrand = cardBrand;
  }

  String getCardIssuerCountry() {
    return this.cardIssuerCountry;
  }

  void setCardIssuerCountry(String cardIssuerCountry) {
    this.cardIssuerCountry = cardIssuerCountry;
  }

  String getCardIssuerCountryCode() {
    return this.cardIssuerCountryCode;
  }

  void setCardIssuerCountryCode(String cardIssuerCountryCode) {
    this.cardIssuerCountryCode = cardIssuerCountryCode;
  }

  String getCurrencyType() {
    return this.currencyType;
  }

  void setCurrencyType(String currencyType) {
    this.currencyType = currencyType;
  }

  String getCurrencyAmount() {
    return this.currencyAmount;
  }

  void setCurrencyAmount(String currencyAmount) {
    this.currencyAmount = currencyAmount;
  }

  String getCurrencyRate() {
    return this.currencyRate;
  }

  void setCurrencyRate(String currencyRate) {
    this.currencyRate = currencyRate;
  }

  String getBaseFair() {
    return this.baseFair;
  }

  void setBaseFair(String baseFair) {
    this.baseFair = baseFair;
  }

  String getValueA() {
    return this.valueA;
  }

  void setValueA(String valueA) {
    this.valueA = valueA;
  }

  String getValueB() {
    return this.valueB;
  }

  void setValueB(String valueB) {
    this.valueB = valueB;
  }

  String getValueC() {
    return this.valueC;
  }

  void setValueC(String valueC) {
    this.valueC = valueC;
  }

  String getValueD() {
    return this.valueD;
  }

  void setValueD(String valueD) {
    this.valueD = valueD;
  }

  String getRiskTitle() {
    return this.riskTitle;
  }

  void setRiskTitle(String riskTitle) {
    this.riskTitle = riskTitle;
  }

  String getRiskLevel() {
    return this.riskLevel;
  }

  void setRiskLevel(String riskLevel) {
    this.riskLevel = riskLevel;
  }

  String getAPIConnect() {
    return this.aPIConnect;
  }

  void setAPIConnect(String aPIConnect) {
    this.aPIConnect = aPIConnect;
  }

  String getValidatedOn() {
    return this.validatedOn;
  }

  void setValidatedOn(String validatedOn) {
    this.validatedOn = validatedOn;
  }

  String getGwVersion() {
    return this.gwVersion;
  }

  void setGwVersion(String gwVersion) {
    this.gwVersion = gwVersion;
  }

  factory SSLCTransactionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SSLCTransactionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SSLCTransactionInfoModelToJson(this);
}
