/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'additional_initializer.g.dart';

@JsonSerializable()
class AdditionalInitializer {
  String valueA;
  String valueB;
  String valueC;
  String valueD;

  AdditionalInitializer(
      {String valueA, String valueB, String valueC, String valueD}) {
    this.valueA = valueA;
    this.valueB = valueB;
    this.valueC = valueC;
    this.valueD = valueD;
  }

  factory AdditionalInitializer.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInitializerToJson(this);
}
