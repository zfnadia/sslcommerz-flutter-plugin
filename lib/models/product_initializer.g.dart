// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_initializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInitializer _$ProductInitializerFromJson(Map<String, dynamic> json) {
  return ProductInitializer()
    ..productName = json['productName'] as String
    ..productCategory = json['productCategory'] as String
    ..cart = json['cart'] as String
    ..productAmount = (json['productAmount'] as num)?.toDouble()
    ..vat = (json['vat'] as num)?.toDouble()
    ..discountAmount = (json['discountAmount'] as num)?.toDouble()
    ..convenienceFee = (json['convenienceFee'] as num)?.toDouble()
    ..productProfile = json['productProfile'] == null
        ? null
        : ProductProfile.fromJson(
            json['productProfile'] as Map<String, dynamic>)
    ..airlinesTicket = json['airlinesTicket'] == null
        ? null
        : AirlinesTicket.fromJson(
            json['airlinesTicket'] as Map<String, dynamic>)
    ..general = json['general'] == null
        ? null
        : General.fromJson(json['general'] as Map<String, dynamic>)
    ..physicalGoods = json['physicalGoods'] == null
        ? null
        : PhysicalGoods.fromJson(json['physicalGoods'] as Map<String, dynamic>)
    ..nonPhysicalGoods = json['nonPhysicalGoods'] == null
        ? null
        : NonPhysicalGoods.fromJson(
            json['nonPhysicalGoods'] as Map<String, dynamic>)
    ..telecomVertical = json['telecomVertical'] == null
        ? null
        : TelecomVertical.fromJson(
            json['telecomVertical'] as Map<String, dynamic>)
    ..travelVertical = json['travelVertical'] == null
        ? null
        : TravelVertical.fromJson(
            json['travelVertical'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductInitializerToJson(ProductInitializer instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productCategory': instance.productCategory,
      'cart': instance.cart,
      'productAmount': instance.productAmount,
      'vat': instance.vat,
      'discountAmount': instance.discountAmount,
      'convenienceFee': instance.convenienceFee,
      'productProfile': instance.productProfile?.toJson(),
      'airlinesTicket': instance.airlinesTicket?.toJson(),
      'general': instance.general?.toJson(),
      'physicalGoods': instance.physicalGoods?.toJson(),
      'nonPhysicalGoods': instance.nonPhysicalGoods?.toJson(),
      'telecomVertical': instance.telecomVertical?.toJson(),
      'travelVertical': instance.travelVertical?.toJson(),
    };

ProductProfile _$ProductProfileFromJson(Map<String, dynamic> json) {
  return ProductProfile();
}

Map<String, dynamic> _$ProductProfileToJson(ProductProfile instance) =>
    <String, dynamic>{};

AirlinesTicket _$AirlinesTicketFromJson(Map<String, dynamic> json) {
  return AirlinesTicket(
    json['productProfile'] as String,
    json['hoursTillDeparture'] as String,
    json['flightType'] as String,
    json['pnr'] as String,
    json['journeyFromTo'] as String,
    json['thirdPartyBooking'] as String,
  );
}

Map<String, dynamic> _$AirlinesTicketToJson(AirlinesTicket instance) =>
    <String, dynamic>{
      'productProfile': instance.productProfile,
      'hoursTillDeparture': instance.hoursTillDeparture,
      'flightType': instance.flightType,
      'pnr': instance.pnr,
      'journeyFromTo': instance.journeyFromTo,
      'thirdPartyBooking': instance.thirdPartyBooking,
    };

TravelVertical _$TravelVerticalFromJson(Map<String, dynamic> json) {
  return TravelVertical(
    json['productProfile'] as String,
    json['hotelName'] as String,
    json['lengthOfStay'] as String,
    json['checkInTime'] as String,
    json['hotelCity'] as String,
  );
}

Map<String, dynamic> _$TravelVerticalToJson(TravelVertical instance) =>
    <String, dynamic>{
      'productProfile': instance.productProfile,
      'hotelName': instance.hotelName,
      'lengthOfStay': instance.lengthOfStay,
      'checkInTime': instance.checkInTime,
      'hotelCity': instance.hotelCity,
    };

TelecomVertical _$TelecomVerticalFromJson(Map<String, dynamic> json) {
  return TelecomVertical(
    json['productProfile'] as String,
    json['productType'] as String,
    json['topUpNumber'] as String,
    json['countryTopUp'] as String,
  );
}

Map<String, dynamic> _$TelecomVerticalToJson(TelecomVertical instance) =>
    <String, dynamic>{
      'productProfile': instance.productProfile,
      'productType': instance.productType,
      'topUpNumber': instance.topUpNumber,
      'countryTopUp': instance.countryTopUp,
    };

NonPhysicalGoods _$NonPhysicalGoodsFromJson(Map<String, dynamic> json) {
  return NonPhysicalGoods(
    json['productProfile'] as String,
    json['nonPhysicalGoods'] as String,
  );
}

Map<String, dynamic> _$NonPhysicalGoodsToJson(NonPhysicalGoods instance) =>
    <String, dynamic>{
      'nonPhysicalGoods': instance.nonPhysicalGoods,
      'productProfile': instance.productProfile,
    };

PhysicalGoods _$PhysicalGoodsFromJson(Map<String, dynamic> json) {
  return PhysicalGoods(
    json['productProfile'] as String,
    json['physicalGoods'] as String,
  );
}

Map<String, dynamic> _$PhysicalGoodsToJson(PhysicalGoods instance) =>
    <String, dynamic>{
      'physicalGoods': instance.physicalGoods,
      'productProfile': instance.productProfile,
    };

General _$GeneralFromJson(Map<String, dynamic> json) {
  return General(
    json['productProfile'] as String,
    json['general'] as String,
  );
}

Map<String, dynamic> _$GeneralToJson(General instance) => <String, dynamic>{
      'general': instance.general,
      'productProfile': instance.productProfile,
    };
