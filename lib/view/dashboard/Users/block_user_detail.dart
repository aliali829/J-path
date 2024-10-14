import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/false_users_controller.dart';
import 'package:untitled75/view/dashboard/Users/un_block_user_controller.dart';

import '../../../services/User_information.dart';
import 'block_user_controller.dart';

showCustomersBlockController controller = Get.find();
BlockCustomerController controller2 = Get.find();
UnBlockUserController controller3 = Get.find();

class BlockUserDetailes extends StatelessWidget {
  const BlockUserDetailes({super.key});

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
                        clickUnBlockUser();
                      },
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                      )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void clickUnBlockUser() async {
    EasyLoading.show(status: "Loading----");
    await controller3.UnBlockUserOnClick();
    if (controller3.status) {
      EasyLoading.showSuccess("sucses");
      window.location.reload();
      // Get.offAndToNamed(Get.currentRoute);
      //controller.token = UserInformation.User_Token;
      /*    if (kIsWeb) {
        Get.off(WebScreen());
      } else {
        Get.off(MobileHome());
      }*/
      //Get.off(WebScreen());
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
