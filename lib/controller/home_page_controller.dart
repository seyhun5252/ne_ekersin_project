import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ne_ekersin_project/service/endpoints.dart';

import '../model/activity.dart';
import '../service/network_handler.dart';

class HomePageController extends GetxController {
  var userList = [].obs;

  final GlobalKey<FormState> formKey = GlobalKey();

  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final city = TextEditingController();
  final venue = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getListUser();
    super.onInit();
  }

  void getListUser() async {
    final response = await NetworkHandler.get(APIPATH.activiyList);

    List<ActivityRequest> list = (json.decode(response)['data'] as List)
        .map((data) => ActivityRequest.fromJson(data))
        .toList();
    userList.value = list;
  }

  void delete(String? id) async {
    final response = await NetworkHandler.delete(APIPATH.deleteUrl, id!);
    getListUser();
  }

  void userPost() async {
    debugPrint(title.text);
    ActivityRequest activity = ActivityRequest(
      title: title.text,
      venue: venue.text,
      city: city.text,
      category: category.text,
      description: description.text,
    );
    var response =
        await NetworkHandler.post(jsonEncode(activity), APIPATH.addActivity);
    getListUser();
    formKey.currentState!.reset();
  }
}
