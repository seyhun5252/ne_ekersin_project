import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ne_ekersin_project/page/add_user_page.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final vm = Get.put(HomePageController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: vm.userList.length,
          itemBuilder: (BuildContext context, int index) {
            return vm.userList.length < 0
                ? const Text('data yok')
                : Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          vm.userList[index].title.toString(),
                        ),
                        TextButton(
                          onPressed: () {
                            vm.delete(vm.userList[index].id);
                          },
                          child: const Text('Sil'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Düzenle'),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddUser());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
