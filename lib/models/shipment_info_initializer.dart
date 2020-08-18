/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'shipment_info_initializer.g.dart';

@JsonSerializable(explicitToJson: true)
class ShipmentInfoInitializer {
  String shipmentMethod;
  String shipAddress2;
  String shipState;
  int numOfItems;
  ShipmentDetails shipmentDetails;

  ShipmentInfoInitializer(
      String shipmentMethod, int numOfItems, ShipmentDetails shipmentDetails,
      {String shipAddress2, String shipState}) {
    this.shipmentMethod = shipmentMethod;
    this.numOfItems = numOfItems;
    this.shipAddress2 = shipAddress2;
    this.shipState = shipState;
    this.shipmentDetails = shipmentDetails;
  }

  ShipmentInfoInitializer addShipAddress2(String shipAddress2) {
    this.shipAddress2 = shipAddress2;
    return this;
  }

  ShipmentInfoInitializer addShipState(String shipState) {
    this.shipState = shipState;
    return this;
  }

  String getShipmentMethod() {
    return this.shipmentMethod;
  }

  void setShipmentMethod(String shipmentMethod) {
    this.shipmentMethod = shipmentMethod;
  }

  int getNumOfItems() {
    return this.numOfItems;
  }

  void setNumOfItems(int numOfItems) {
    this.numOfItems = numOfItems;
  }

  ShipmentDetails getShipmentDetails() {
    return this.shipmentDetails;
  }

  void setShipmentDetails(ShipmentDetails shipmentDetails) {
    this.shipmentDetails = shipmentDetails;
  }

  String getShipAddress2() {
    return this.shipAddress2;
  }

  void setShipAddress2(String shipAddress2) {
    this.shipAddress2 = shipAddress2;
  }

  String getShipState() {
    return this.shipState;
  }

  void setShipState(String shipState) {
    this.shipState = shipState;
  }

  factory ShipmentInfoInitializer.fromJson(Map<String, dynamic> json) =>
      _$ShipmentInfoInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentInfoInitializerToJson(this);
}

@JsonSerializable()
class ShipmentDetails {
  String shipName;
  String shipAddress1;
  String shipCity;
  String shipPostCode;
  String shipCountry;

  ShipmentDetails(String shipName, String shipAddress1, String shipCity,
      String shipPostCode, String shipCountry) {
    this.shipName = shipName;
    this.shipAddress1 = shipAddress1;
    this.shipCity = shipCity;
    this.shipPostCode = shipPostCode;
    this.shipCountry = shipCountry;
  }

  String getShipName() {
    return this.shipName;
  }

  void setShipName(String shipName) {
    this.shipName = shipName;
  }

  String getShipAddress1() {
    return this.shipAddress1;
  }

  void setShipAddress1(String shipAddress1) {
    this.shipAddress1 = shipAddress1;
  }

  String getShipCity() {
    return this.shipCity;
  }

  void setShipCity(String shipCity) {
    this.shipCity = shipCity;
  }

  String getShipPostCode() {
    return this.shipPostCode;
  }

  void setShipPostCode(String shipPostCode) {
    this.shipPostCode = shipPostCode;
  }

  String getShipCountry() {
    return this.shipCountry;
  }

  void setShipCountry(String shipCountry) {
    this.shipCountry = shipCountry;
  }

  factory ShipmentDetails.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentDetailsToJson(this);
}
