// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info_initializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerInfoInitializer _$CustomerInfoInitializerFromJson(
    Map<String, dynamic> json) {
  return CustomerInfoInitializer(
    json['customerName'] as String,
    json['customerEmail'] as String,
    json['customerAddress1'] as String,
    json['customerCity'] as String,
    json['customerPostCode'] as String,
    json['customerCountry'] as String,
    json['customerPhone'] as String,
  )
    ..customerAddress2 = json['customerAddress2'] as String
    ..customerState = json['customerState'] as String
    ..customerFax = json['customerFax'] as String;
}

Map<String, dynamic> _$CustomerInfoInitializerToJson(
        CustomerInfoInitializer instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'customerAddress1': instance.customerAddress1,
      'customerAddress2': instance.customerAddress2,
      'customerCity': instance.customerCity,
      'customerState': instance.customerState,
      'customerPostCode': instance.customerPostCode,
      'customerCountry': instance.customerCountry,
      'customerPhone': instance.customerPhone,
      'customerFax': instance.customerFax,
    };
