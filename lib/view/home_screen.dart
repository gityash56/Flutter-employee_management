import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import './employee_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final userController = Get.put(UserController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee'),
        centerTitle: true,
      ),
      body: Obx(
        () => userController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search by Employee ID',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) =>
                          userController.filterUserById(value),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.to(
                        EmployeeDetailScreen(),
                        duration: const Duration(milliseconds: 800),
                        transition: Transition.leftToRight,
                      ),
                      child: ListView.builder(
                          itemCount: userController.userList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.amber[200],
                              child: ListTile(
                                title: Text(
                                  userController.userList[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
