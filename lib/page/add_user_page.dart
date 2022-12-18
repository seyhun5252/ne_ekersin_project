import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ne_ekersin_project/page/home_page_genel.dart';

import '../controller/home_page_controller.dart';

class AddUser extends StatelessWidget {
  final vm = Get.put(HomePageController());

  AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanci Ekleme"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: vm.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: vm.title,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: vm.description,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: vm.category,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: vm.city,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: vm.venue,
                decoration: const InputDecoration(labelText: 'Venue'),
              ),
              TextButton(
                onPressed: () {
                  vm.userPost();
                  Get.to(HomePageGenel());
                },
                child: const Text("Add User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
