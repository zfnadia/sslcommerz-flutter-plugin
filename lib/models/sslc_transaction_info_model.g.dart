// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sslc_transaction_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSLCTransactionInfoModel _$SSLCTransactionInfoModelFromJson(
    Map<String, dynamic> json) {
  return SSLCTransactionInfoModel()
    ..status = json['status'] as String
    ..sessionkey = json['sessionkey'] as String
    ..tranDate = json['tran_date'] as String
    ..tranId = json['tran_id'] as String
    ..valId = json['val_id'] as String
    ..amount = json['amount'] as String
    ..storeAmount = json['store_amount'] as String
    ..bankTranId = json['bank_tran_id'] as String
    ..cardType = json['card_type'] as String
    ..cardNo = json['card_no'] as String
    ..cardIssuer = json['card_issuer'] as String
    ..cardBrand = json['card_brand'] as String
    ..cardIssuerCountry = json['card_issuer_country'] as String
    ..cardIssuerCountryCode = json['card_issuer_country_code'] as String
    ..currencyType = json['currency_type'] as String
    ..currencyAmount = json['currency_amount'] as String
    ..currencyRate = json['currency_rate'] as String
    ..baseFair = json['base_fair'] as String
    ..valueA = json['value_a'] as String
    ..valueB = json['value_b'] as String
    ..valueC = json['value_c'] as String
    ..valueD = json['value_d'] as String
    ..riskTitle = json['risk_title'] as String
    ..riskLevel = json['risk_level'] as String
    ..apiConnect = json['APIConnect'] as String
    ..validatedOn = json['validated_on'] as String
    ..gwVersion = json['gw_version'] as String;
}

Map<String, dynamic> _$SSLCTransactionInfoModelToJson(
        SSLCTransactionInfoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sessionkey': instance.sessionkey,
      'tran_date': instance.tranDate,
      'tran_id': instance.tranId,
      'val_id': instance.valId,
      'amount': instance.amount,
      'store_amount': instance.storeAmount,
      'bank_tran_id': instance.bankTranId,
      'card_type': instance.cardType,
      'card_no': instance.cardNo,
      'card_issuer': instance.cardIssuer,
      'card_brand': instance.cardBrand,
      'card_issuer_country': instance.cardIssuerCountry,
      'card_issuer_country_code': instance.cardIssuerCountryCode,
      'currency_type': instance.currencyType,
      'currency_amount': instance.currencyAmount,
      'currency_rate': instance.currencyRate,
      'base_fair': instance.baseFair,
      'value_a': instance.valueA,
      'value_b': instance.valueB,
      'value_c': instance.valueC,
      'value_d': instance.valueD,
      'risk_title': instance.riskTitle,
      'risk_level': instance.riskLevel,
      'APIConnect': instance.apiConnect,
      'validated_on': instance.validatedOn,
      'gw_version': instance.gwVersion,
    };
