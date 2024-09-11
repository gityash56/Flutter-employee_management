import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

class EmployeeDetailScreen extends StatelessWidget {
  EmployeeDetailScreen({super.key});

  // create and instance userController
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee DetailScreen'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.cyan[200],
                child: ListTile(
                  title: Text(
                    userController.userList[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    child: Text(userController.userList[index].id),
                  ),
                  subtitle: Text(userController.userList[index].emailId),
                  trailing: Text(userController.userList[index].mobile),
                ),
              );
            }),
      ),
    );
  }
}
