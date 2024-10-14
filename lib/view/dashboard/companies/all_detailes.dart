import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/companies/all_companies_controller.dart';

showAllCompaniesController controller = Get.find();

class AllDetailes extends StatelessWidget {
  const AllDetailes({super.key});

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
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.safety_check_sharp),
                        Text("${controller.companiesList[index].status}"),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
