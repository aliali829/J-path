import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Trips/accept_offer_controller.dart';
import 'package:untitled75/view/dashboard/Trips/all_offers_controller.dart';
import 'package:untitled75/view/dashboard/Trips/block_offer_controller.dart';
import 'package:untitled75/view/dashboard/Trips/controller_offer.dart';
import 'package:untitled75/view/dashboard/Trips/false_offer_controller.dart';
import 'package:untitled75/view/dashboard/Trips/tripRes_detail.dart';
import 'package:untitled75/view/dashboard/Trips/trip_act_detail.dart';
import 'package:untitled75/view/dashboard/Trips/trip_pend_detail.dart';
import 'package:untitled75/view/dashboard/Trips/true_offer_controller.dart';

import '../../../services/User_information.dart';
import '../companies/all_detailes.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
showOffersPendingController controller = Get.find();
AcceptOfferController controller2 = Get.find();
RefuseOfferController controller3 = Get.find();
showOffersActiveController controller4 = Get.find();
showoffersRefuseController controller5 = Get.find();
showAllOffersController controller6 = Get.find();

class Trips extends StatelessWidget {
  const Trips({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //   key: scaffoldKey,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DashBoard-Trips"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.offNamed("/DashBoard");
                },
                icon: Icon(Icons.dashboard_customize_outlined)),
            SizedBox(width: 10),
            IconButton(
                onPressed: () {
                  window.location.reload();
                },
                icon: Icon(Icons.refresh))
          ],
          bottom: const TabBar(
            tabs: [
              Text("Trips Pending"),
              Text("Trips Active"),
              Text("Trips Block"),
              Text(" All Trips"),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: [
              ////////////////////////////
              SafeArea(child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.offersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(tripPendDetailes());
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "From: ${controller.offersList[index].source}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "To: ${controller.offersList[index].destination}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 700),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        UserInformation.offer_id =
                                            controller.offersList[index].id;
                                        clickAcceptOffer();
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        UserInformation.offer_id =
                                            controller.offersList[index].id;
                                        clickRefuseOffer();
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              })),
              ///////////////////////////////
              SafeArea(child: Obx(() {
                if (controller4.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller4.offersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(tripActDetailes());
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "From: ${controller4.offersList[index].source}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "To: ${controller4.offersList[index].destination}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 700),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        UserInformation.offer_id =
                                            controller4.offersList[index].id;
                                        clickRefuseOffer();
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              })),
              ///////////////////////////////////
              SafeArea(child: Obx(() {
                if (controller5.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller5.offersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(tripRefDetailes());
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "From: ${controller5.offersList[index].source}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "To: ${controller5.offersList[index].destination}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 700),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        UserInformation.offer_id =
                                            controller5.offersList[index].id;
                                        clickAcceptOffer();
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              })),
              //////////////////////////////
              SafeArea(child: Obx(() {
                if (controller6.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller6.offersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(AllDetailes());
                        },
                        child: ListTile(
                            trailing: Text(
                              "${controller6.offersList[index].status}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            //child: Text("${controller.companiesList[index].name}"),
                            title: Text(
                              "From: ${controller6.offersList[index].source}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(children: [
                              Column(
                                children: [
                                  Text(
                                    "To: ${controller6.offersList[index].destination}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ])),
                      ),
                    );
                  },
                );
              })),
              /////////////////////////////////
            ],
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

  void clickRefuseOffer() async {
    EasyLoading.show(status: "Loading----");
    await controller3.RefuseOfferOnClick();
    if (controller3.status) {
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
