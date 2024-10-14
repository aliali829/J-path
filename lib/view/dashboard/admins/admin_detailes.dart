import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/admins/show_admins_controller.dart';

showAdminsController controller = Get.find();

class AdminDetailes extends StatelessWidget {
  const AdminDetailes({super.key});

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
            itemCount: controller.adminsList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("${controller.adminsList[index].firstName}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("${controller.adminsList[index].lastName}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        Text("${controller.adminsList[index].email}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        Text("${controller.adminsList[index].phoneNumber}"),
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
