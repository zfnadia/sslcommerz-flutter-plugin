/// Created by Nadia Ferdoush on 18/09/2020.
/// Copyright (c) 2020. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'emi_transaction_initializer.g.dart';

@JsonSerializable()
class EMITransactionInitializer {
  int emi_options;
  int emi_max_list_options;
  int emi_selected_inst;

  EMITransactionInitializer(int emi_options) {
    this.emi_options = emi_options;
  }

  EMITransactionInitializer addEmiMaxListOptions(int emi_max_list_options) {
    this.emi_max_list_options = emi_max_list_options;
    return this;
  }

  EMITransactionInitializer addEmiSelectedInst(int emi_selected_inst) {
    this.emi_selected_inst = emi_selected_inst;
    return this;
  }

  int getEmi_options() {
    return this.emi_options;
  }

  void setEmi_options(int emi_options) {
    this.emi_options = emi_options;
  }

  int getEmi_max_list_options() {
    return this.emi_max_list_options;
  }

  void setEmi_max_list_options(int emi_max_list_options) {
    this.emi_max_list_options = emi_max_list_options;
  }

  int getEmi_selected_inst() {
    return this.emi_selected_inst;
  }

  void setEmi_selected_inst(int emi_selected_inst) {
    this.emi_selected_inst = emi_selected_inst;
  }

  factory EMITransactionInitializer.fromJson(Map<String, dynamic> json) =>
      _$EMITransactionInitializerFromJson(json);

  Map<String, dynamic> toJson() => _$EMITransactionInitializerToJson(this);
}
