import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/weather.dart';
import '../service/endpoints.dart';
import '../service/network_handler.dart';

class WeatherPageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  var weatherList = [].obs;

  final city = TextEditingController();

  void getListWeather() async {
    final response =
        await NetworkHandler.getWeatherCity(APIPATH.getWeather, city.text);

    List<WeatherModel> list = (json.decode(response)['data'] as List)
        .map((data) => WeatherModel.fromJson(data))
        .toList();
    weatherList.value = list;
  }
}
