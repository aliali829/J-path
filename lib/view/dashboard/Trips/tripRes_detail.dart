import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled75/view/dashboard/Trips/false_offer_controller.dart';

import '../../../services/User_information.dart';
import 'accept_offer_controller.dart';
import 'block_offer_controller.dart';

DateFormat formatter = DateFormat("yyyy-MM-dd");
showoffersRefuseController controller = Get.find();
AcceptOfferController controller2 = Get.find();
RefuseOfferController controller3 = Get.find();

class tripRefDetailes extends StatelessWidget {
  const tripRefDetailes({super.key});

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
            itemCount: controller.offersList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.location_city),
                        Text("${controller.offersList[index].source}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.location_city),
                        Text("${controller.offersList[index].destination}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.date_range),
                        Text(
                            "${formatter.format(controller.offersList[index].tripDate)}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Row(
                      children: [
                        Icon(Icons.punch_clock),
                        Text("${controller.offersList[index].startHour}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            UserInformation.offer_id =
                                controller.offersList[index].id;
                            Get.back();
                            clickAcceptOffer();
                          },
                          icon: Icon(
                            Icons.check,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void clickAcceptOffer() async {
    EasyLoading.show(status: "Loading----");
    await controller2.AcceptOfferOnClick();
    if (controller2.status) {
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
