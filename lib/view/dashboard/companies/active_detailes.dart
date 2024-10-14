import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/companies/block_controller.dart';
import 'package:untitled75/view/dashboard/companies/true_companies_comtroller.dart';

import '../../../services/User_information.dart';

ShowCompaniesActiveController controller = Get.find();
BlockCompanyController controller2 = Get.find();

class ActiveDetailes extends StatelessWidget {
  const ActiveDetailes({super.key});

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
            itemCount: controller.companiesList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.store),
                        Text("${controller.companiesList[index].name}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        Text("${controller.companiesList[index].location}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.description),
                        Text("${controller.companiesList[index].descr}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.tour),
                        Text("${controller.companiesList[index].serviceType}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        Text("${controller.companiesList[index].phone}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                      onPressed: () {
                        UserInformation.Cpmpany_id =
                            controller.companiesList[index].id;
                        Get.back();
                        clickBlockCompany();
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

  void clickBlockCompany() async {
    EasyLoading.show(status: "Loading----");
    await controller2.BlockCompanyOnClick();
    if (controller2.status) {
      EasyLoading.showSuccess("sucses");

      window.location.reload();
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
