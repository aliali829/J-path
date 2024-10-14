import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/widget/custom_form_button.dart';

import 'controller_balance.dart';

showBalanceController controller = Get.find();

class ShowBalance extends StatelessWidget {
  const ShowBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Balance"),
        actions: [
          SizedBox(width: 10),
          IconButton(
              onPressed: () {
                window.location.reload();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SafeArea(child: Obx(() {
          if (controller.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: controller.walletList.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${controller.walletList[index].balance}\$",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    SizedBox(height: 16),
                    CustomFormButton(
                        innerText: "Ok",
                        onPressed: () {
                          Get.offNamed("/MainPage");
                        }),
                  ],
                ),
              );

              /*Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.black),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    //  Get.to(AdminDetailes());
                    // Get.to(ComDetailes());
                    // controller2.id = controller.companiesList[index].id;
                  },
                  child: ListTile(
                    //child: Text("${controller.companiesList[index].name}"),
                    title: Text(
                      "${controller.walletList[index].balance}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${controller.adminsList[index].lastName}",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text(
                      "${controller.adminsList[index].role}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );*/
            },
          );
        })),
      ),
    );
  }
}
