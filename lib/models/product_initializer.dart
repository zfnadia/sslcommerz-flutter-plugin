/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'product_initializer.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductInitializer {
  String productName;
  String productCategory;
  String cart;
  double productAmount;
  double vat;
  double discountAmount;
  double convenienceFee;
  ProductProfile productProfile;
  AirlinesTicket airlinesTicket;
  General general;
  PhysicalGoods physicalGoods;
  NonPhysicalGoods nonPhysicalGoods;
  TelecomVertical telecomVertical;
  TravelVertical travelVertical;

  ProductInitializer();

  ProductInitializer.airlinesTicket(String productName, String productCategory,
      AirlinesTicket productProfile) {
    this.productName = productName;
    this.productCategory = productCategory;
    this.airlinesTicket = productProfile;
  }

  ProductInitializer.general(
      String productName, String productCategory, General productProfile) {
    this.productName = productName;
    this.productCategory = productCategory;
    this.general = productProfile;
  }

  ProductInitializer.physicalGoods(String productName, String productCategory,
      PhysicalGoods productProfile) {
    this.productName = productName;
    this.productCategory = productCategory;
    this.physicalGoods = productProfile;
  }

  ProductInitializer.nonPhysicalGoods(String productName,
      String productCategory, NonPhysicalGoods productProfile) {
    this.productName = productName;
    this.productCategory = productCategory;
    this.nonPhysicalGoods = productProfile;
  }

  ProductInitializer.travelVertical(String productName, String productCategory,
      TravelVertical productProfile) {
    this.productName = productName;
    this.productCategory = productCategory;
    this.travelVertical = productProfile;
  }

  ProductInitializer.telecomVertical(String productName, String productCategory,
      TelecomVertical productProfile) {
    this.productName = productName;
    this.productCategory = productCategory;
    this.telecomVertical = productProfile;
  }

  ProductProfile getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(ProductProfile productProfile) {
    this.productProfile = productProfile;
  }

  PhysicalGoods getPhysicalGoods() {
    return this.physicalGoods;
  }

  void setPhysicalGoods(PhysicalGoods physicalGoods) {
    this.physicalGoods = physicalGoods;
  }

  NonPhysicalGoods getNonPhysicalGoods() {
    return this.nonPhysicalGoods;
  }

  void setNonPhysicalGoods(NonPhysicalGoods nonPhysicalGoods) {
    this.nonPhysicalGoods = nonPhysicalGoods;
  }

  TelecomVertical getTelecomVertical() {
    return this.telecomVertical;
  }

  void setTelecomVertical(TelecomVertical telecomVertical) {
    this.telecomVertical = telecomVertical;
  }

  TravelVertical getTravelVertical() {
    return this.travelVertical;
  }

  void setTravelVertical(TravelVertical travelVertical) {
    this.travelVertical = travelVertical;
  }

  AirlinesTicket getAirlinesTicket() {
    return this.airlinesTicket;
  }

  void setAirlinesTicket(AirlinesTicket airlinesTicket) {
    this.airlinesTicket = airlinesTicket;
  }

  General getGeneral() {
    return this.general;
  }

  void setGeneral(General general) {
    this.general = general;
  }

  ProductInitializer addCart(String cart) {
    this.cart = cart;
    return this;
  }

  ProductInitializer addProductAmount(double productAmount) {
    this.productAmount = productAmount;
    return this;
  }

  ProductInitializer addVat(double vat) {
    this.vat = vat;
    return this;
  }

  ProductInitializer addDiscountAmount(double discountAmount) {
    this.discountAmount = discountAmount;
    return this;
  }

  ProductInitializer addConvenienceFee(double convenienceFee) {
    this.convenienceFee = convenienceFee;
    return this;
  }

  String getProductName() {
    return this.productName;
  }

  void setProductName(String productName) {
    this.productName = productName;
  }

  String getProductCategory() {
    return this.productCategory;
  }

  void setProductCategory(String productCategory) {
    this.productCategory = productCategory;
  }

  String getCart() {
    return this.cart;
  }

  void setCart(String cart) {
    this.cart = cart;
  }

  double getProductAmount() {
    return this.productAmount;
  }

  void setProductAmount(double productAmount) {
    this.productAmount = productAmount;
  }

  double getVat() {
    return this.vat;
  }

  void setVat(double vat) {
    this.vat = vat;
  }

  double getDiscountAmount() {
    return this.discountAmount;
  }

  void setDiscountAmount(double discountAmount) {
    this.discountAmount = discountAmount;
  }

  double getConvenienceFee() {
    return this.convenienceFee;
  }

  void setConvenienceFee(double convenienceFee) {
    this.convenienceFee = convenienceFee;
  }

  factory ProductInitializer.fromJson(Map<String, dynamic> json) =>
      _$ProductInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInitializerToJson(this);
}

@JsonSerializable()
class ProductProfile {
  ProductProfile();

  factory ProductProfile.fromJson(Map<String, dynamic> json) =>
      _$ProductProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProductProfileToJson(this);
}

@JsonSerializable()
class AirlinesTicket {
  String productProfile;
  String hoursTillDeparture;
  String flightType;
  String pnr;
  String journeyFromTo;
  String thirdPartyBooking;

  AirlinesTicket(
      String productProfile,
      String hoursTillDeparture,
      String flightType,
      String pnr,
      String journeyFromTo,
      String thirdPartyBooking) {
    this.productProfile = productProfile;
    this.hoursTillDeparture = hoursTillDeparture;
    this.flightType = flightType;
    this.pnr = pnr;
    this.journeyFromTo = journeyFromTo;
    this.thirdPartyBooking = thirdPartyBooking;
  }

  String getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(String productProfile) {
    this.productProfile = productProfile;
  }

  String getHoursTillDeparture() {
    return this.hoursTillDeparture;
  }

  void setHoursTillDeparture(String hoursTillDeparture) {
    this.hoursTillDeparture = hoursTillDeparture;
  }

  String getFlightType() {
    return this.flightType;
  }

  void setFlightType(String flightType) {
    this.flightType = flightType;
  }

  String getPnr() {
    return this.pnr;
  }

  void setPnr(String pnr) {
    this.pnr = pnr;
  }

  String getJourneyFromTo() {
    return this.journeyFromTo;
  }

  void setJourneyFromTo(String journeyFromTo) {
    this.journeyFromTo = journeyFromTo;
  }

  String getThirdPartyBooking() {
    return this.thirdPartyBooking;
  }

  void setThirdPartyBooking(String thirdPartyBooking) {
    this.thirdPartyBooking = thirdPartyBooking;
  }

  factory AirlinesTicket.fromJson(Map<String, dynamic> json) =>
      _$AirlinesTicketFromJson(json);

  Map<String, dynamic> toJson() => _$AirlinesTicketToJson(this);
}

@JsonSerializable()
class TravelVertical {
  String productProfile;
  String hotelName;
  String lengthOfStay;
  String checkInTime;
  String hotelCity;

  TravelVertical(String productProfile, String hotelName, String lengthOfStay,
      String checkInTime, String hotelCity) {
    this.productProfile = productProfile;
    this.hotelName = hotelName;
    this.lengthOfStay = lengthOfStay;
    this.checkInTime = checkInTime;
    this.hotelCity = hotelCity;
  }

  String getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(String productProfile) {
    this.productProfile = productProfile;
  }

  String getHotelName() {
    return this.hotelName;
  }

  void setHotelName(String hotelName) {
    this.hotelName = hotelName;
  }

  String getLengthOfStay() {
    return this.lengthOfStay;
  }

  void setLengthOfStay(String lengthOfStay) {
    this.lengthOfStay = lengthOfStay;
  }

  String getCheckInTime() {
    return this.checkInTime;
  }

  void setCheckInTime(String checkInTime) {
    this.checkInTime = checkInTime;
  }

  String getHotelCity() {
    return this.hotelCity;
  }

  void setHotelCity(String hotelCity) {
    this.hotelCity = hotelCity;
  }

  factory TravelVertical.fromJson(Map<String, dynamic> json) =>
      _$TravelVerticalFromJson(json);

  Map<String, dynamic> toJson() => _$TravelVerticalToJson(this);
}

@JsonSerializable()
class TelecomVertical {
  String productProfile;
  String productType;
  String topUpNumber;
  String countryTopUp;

  TelecomVertical(String productProfile, String productType, String topUpNumber,
      String countryTopUp) {
    this.productProfile = productProfile;
    this.productType = productType;
    this.topUpNumber = topUpNumber;
    this.countryTopUp = countryTopUp;
  }

  String getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(String productProfile) {
    this.productProfile = productProfile;
  }

  String getProductType() {
    return this.productType;
  }

  void setProductType(String productType) {
    this.productType = productType;
  }

  String getTopUpNumber() {
    return this.topUpNumber;
  }

  void setTopUpNumber(String topUpNumber) {
    this.topUpNumber = topUpNumber;
  }

  String getCountryTopUp() {
    return this.countryTopUp;
  }

  void setCountryTopUp(String countryTopUp) {
    this.countryTopUp = countryTopUp;
  }

  factory TelecomVertical.fromJson(Map<String, dynamic> json) =>
      _$TelecomVerticalFromJson(json);

  Map<String, dynamic> toJson() => _$TelecomVerticalToJson(this);
}

@JsonSerializable()
class NonPhysicalGoods {
  String nonPhysicalGoods;
  String productProfile;

  NonPhysicalGoods(String productProfile, String nonPhysicalGoods) {
    this.productProfile = productProfile;
    this.nonPhysicalGoods = nonPhysicalGoods;
  }

  String getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(String productProfile) {
    this.productProfile = productProfile;
  }

  String getNonPhysicalGoods() {
    return this.nonPhysicalGoods;
  }

  void setNonPhysicalGoods(String nonPhysicalGoods) {
    this.nonPhysicalGoods = nonPhysicalGoods;
  }

  factory NonPhysicalGoods.fromJson(Map<String, dynamic> json) =>
      _$NonPhysicalGoodsFromJson(json);

  Map<String, dynamic> toJson() => _$NonPhysicalGoodsToJson(this);
}

@JsonSerializable()
class PhysicalGoods {
  String physicalGoods;
  String productProfile;

  PhysicalGoods(String productProfile, String physicalGoods) {
    this.productProfile = productProfile;
    this.physicalGoods = physicalGoods;
  }

  String getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(String productProfile) {
    this.productProfile = productProfile;
  }

  String getPhysicalGoods() {
    return this.physicalGoods;
  }

  void setPhysicalGoods(String physicalGoods) {
    this.physicalGoods = physicalGoods;
  }

  factory PhysicalGoods.fromJson(Map<String, dynamic> json) =>
      _$PhysicalGoodsFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalGoodsToJson(this);
}

@JsonSerializable()
class General {
  String general;
  String productProfile;

  General(String productProfile, String general) {
    this.productProfile = productProfile;
    this.general = general;
  }

  String getProductProfile() {
    return this.productProfile;
  }

  void setProductProfile(String productProfile) {
    this.productProfile = productProfile;
  }

  String getGeneral() {
    return this.general;
  }

  void setGeneral(String general) {
    this.general = general;
  }

  factory General.fromJson(Map<String, dynamic> json) =>
      _$GeneralFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralToJson(this);
}
