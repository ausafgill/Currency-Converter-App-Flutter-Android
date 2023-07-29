// To parse this JSON data, do
//
//     final allRatesModel = allRatesModelFromJson(jsonString);

import 'dart:convert';

AllRatesModel allRatesModelFromJson(String str) =>
    AllRatesModel.fromJson(json.decode(str));

String allRatesModelToJson(AllRatesModel data) => json.encode(data.toJson());

class AllRatesModel {
  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  AllRatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  factory AllRatesModel.fromJson(Map<String, dynamic> json) => AllRatesModel(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
