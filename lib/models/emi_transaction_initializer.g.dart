// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emi_transaction_initializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EMITransactionInitializer _$EMITransactionInitializerFromJson(
    Map<String, dynamic> json) {
  return EMITransactionInitializer(
    json['emi_options'] as int,
  )
    ..emi_max_list_options = json['emi_max_list_options'] as int
    ..emi_selected_inst = json['emi_selected_inst'] as int;
}

Map<String, dynamic> _$EMITransactionInitializerToJson(
        EMITransactionInitializer instance) =>
    <String, dynamic>{
      'emi_options': instance.emi_options,
      'emi_max_list_options': instance.emi_max_list_options,
      'emi_selected_inst': instance.emi_selected_inst,
    };
