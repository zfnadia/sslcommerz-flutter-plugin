/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) Nadia Ferdoush 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'additional_initializer.g.dart';

@JsonSerializable()
class AdditionalInitializer {
  String valueA;
  String valueB;
  String valueC;
  String valueD;

  AdditionalInitializer();

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

  factory AdditionalInitializer.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInitializerToJson(this);
}
