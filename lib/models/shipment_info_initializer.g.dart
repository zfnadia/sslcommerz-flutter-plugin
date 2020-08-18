// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_info_initializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentInfoInitializer _$ShipmentInfoInitializerFromJson(
    Map<String, dynamic> json) {
  return ShipmentInfoInitializer(
    json['shipmentMethod'] as String,
    json['numOfItems'] as int,
    json['shipmentDetails'] == null
        ? null
        : ShipmentDetails.fromJson(
            json['shipmentDetails'] as Map<String, dynamic>),
    shipAddress2: json['shipAddress2'] as String,
    shipState: json['shipState'] as String,
  );
}

Map<String, dynamic> _$ShipmentInfoInitializerToJson(
        ShipmentInfoInitializer instance) =>
    <String, dynamic>{
      'shipmentMethod': instance.shipmentMethod,
      'shipAddress2': instance.shipAddress2,
      'shipState': instance.shipState,
      'numOfItems': instance.numOfItems,
      'shipmentDetails': instance.shipmentDetails?.toJson(),
    };

ShipmentDetails _$ShipmentDetailsFromJson(Map<String, dynamic> json) {
  return ShipmentDetails(
    json['shipName'] as String,
    json['shipAddress1'] as String,
    json['shipCity'] as String,
    json['shipPostCode'] as String,
    json['shipCountry'] as String,
  );
}

Map<String, dynamic> _$ShipmentDetailsToJson(ShipmentDetails instance) =>
    <String, dynamic>{
      'shipName': instance.shipName,
      'shipAddress1': instance.shipAddress1,
      'shipCity': instance.shipCity,
      'shipPostCode': instance.shipPostCode,
      'shipCountry': instance.shipCountry,
    };
