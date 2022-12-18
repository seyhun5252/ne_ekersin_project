import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ne_ekersin_project/controller/weather_page_controller.dart';

class WeatherPage extends StatelessWidget {
  final vm = Get.put(WeatherPageController());

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: vm.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: vm.city,
                    decoration:
                        const InputDecoration(labelText: 'Sehir giriniz'),
                  ),
                  TextButton(
                    onPressed: () {
                      vm.getListWeather();
                    },
                    child: const Text("Göster"),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: vm.weatherList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return vm.weatherList.isEmpty
                            ? const Text('data yok')
                            : Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      vm.weatherList[index].min.toString(),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
