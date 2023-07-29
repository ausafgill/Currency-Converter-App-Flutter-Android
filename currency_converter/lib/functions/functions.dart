import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:currency_converter/models/all_currencies_model.dart';

import '../models/all_rates.dart';

Future<Map> getallcurrencies() async {
  final response = await http.get(Uri.parse(
      "https://openexchangerates.org/api/currencies.json?show_alternative=1b712f78d2ee14c249133cc0c96ae4cfd"));

  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

Future<AllRatesModel> getallrates() async {
  final response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?app_id=b712f78d2ee14c249133cc0c96ae4cfd'));

  final allcurrencies = allRatesModelFromJson(response.body);
  return allcurrencies;
}

String convertedUsd(Map rates, String usd, String currency) {
  String finalAns =
      ((rates[currency] * double.parse(usd)).toStringAsFixed(2)).toString();
  return finalAns;
}

String anyToAny(Map rates, String anyval, String drop1, String drop2) {
  String output =
      ((double.parse(anyval) / rates[drop1] * rates[drop2]).toStringAsFixed(2))
          .toString();
  return output;
}
