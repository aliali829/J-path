import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/show_users_controller.dart';

import '../../../services/User_information.dart';
import 'block_user_controller.dart';

showCustomersActiveController controller = Get.find();
BlockCustomerController controller2 = Get.find();

class ActiveUserDetailes extends StatelessWidget {
  const ActiveUserDetailes({super.key});

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
                  IconButton(
                      onPressed: () {
                        UserInformation.User_id =
                            controller.customersList[index].id;
                        Get.back();
                        clickBlockCustomers();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void clickBlockCustomers() async {
    EasyLoading.show(status: "Loading----");
    await controller2.BlockCustomerOnClick();
    if (controller2.status) {
      EasyLoading.showSuccess("sucses");
      window.location.reload();
    } else {
      EasyLoading.showError(
        // controller.message,
        "error",
        duration: const Duration(seconds: 6),
        dismissOnTap: true,
      );
    }
  }
}
