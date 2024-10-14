import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/admins/admin_detailes.dart';
import 'package:untitled75/view/dashboard/admins/show_admins_controller.dart';

showAdminsController controller = Get.find();

class Admins extends StatelessWidget {
  const Admins({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard-Admins"),
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
            itemCount: controller.adminsList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.black),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(AdminDetailes());
                    // Get.to(ComDetailes());
                    // controller2.id = controller.companiesList[index].id;
                  },
                  child: ListTile(
                    //child: Text("${controller.companiesList[index].name}"),
                    title: Text(
                      "${controller.adminsList[index].firstName}",
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
              );
            },
          );
        })),
      ),
    );
  }
}
