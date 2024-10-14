import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/all_users_controller.dart';
import 'package:untitled75/view/dashboard/Users/un_block_user_controller.dart';

import 'block_user_controller.dart';

showAllCustomersController controller = Get.find();
BlockCustomerController controller2 = Get.find();
UnBlockUserController controller3 = Get.find();

class UseDetailes extends StatelessWidget {
  const UseDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailes"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: controller.customersList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("${controller.customersList[index].firstName}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("${controller.customersList[index].lastName}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        Text("${controller.customersList[index].email}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        Text("${controller.customersList[index].phoneNumber}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
