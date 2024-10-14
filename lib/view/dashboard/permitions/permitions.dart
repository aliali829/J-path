import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Trips/accept_offer_controller.dart';
import 'package:untitled75/view/dashboard/Trips/block_offer_controller.dart';
import 'package:untitled75/view/dashboard/Trips/controller_offer.dart';

import '../../../services/User_information.dart';
import '../Trips/trip_pend_detail.dart';
import '../companies/block_controller.dart';
import '../companies/com_detailes.dart';
import '../show compnies/accept_controller.dart';
import '../show compnies/controller_show_companies.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
showCompaniesController controller = Get.find();
AcceptCompanyController controller2 = Get.find();
BlockCompanyController controller3 = Get.find();
showOffersPendingController controller4 = Get.find();
AcceptOfferController controller5 = Get.find();
RefuseOfferController controller6 = Get.find();

class Permissions extends StatelessWidget {
  const Permissions({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //   key: scaffoldKey,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DashBoard-Permissions"),
          actions: [
            IconButton(
                onPressed: () {
                  window.location.reload();
                },
                icon: Icon(Icons.refresh))
          ],
          bottom: const TabBar(
            tabs: [
              Text("Companies Pending"),
              Text(" Trips Pending "),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: [
              //Text("Companies Pending"),
              //////////////////////////////////////////////////////////
              SafeArea(child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.companiesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(ComDetailes());
                          // controller2.id = controller.companiesList[index].id;
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "${controller.companiesList[index].name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${controller.companiesList[index].serviceType}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    //"${controller.companiesList[index].id}",
                                    "${UserInformation.Cpmpany_id}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 700),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        UserInformation.Cpmpany_id =
                                            controller.companiesList[index].id;
                                        clickAcceptCompany();
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        UserInformation.Cpmpany_id =
                                            controller.companiesList[index].id;
                                        clickBlockCompany();
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
              //////////////////////////////////////////////////////
              SafeArea(child: Obx(() {
                if (controller.isLoading.isTrue) {
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
                          Get.to(tripPendDetailes());
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
                                        clickAcceptOffer();
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )),
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
              ////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }

  void clickAcceptCompany() async {
    EasyLoading.show(status: "Loading----");
    await controller2.AcceptCompanyOnClick();
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

  void clickBlockCompany() async {
    EasyLoading.show(status: "Loading----");
    await controller3.BlockCompanyOnClick();
    if (controller3.status) {
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

  void clickAcceptOffer() async {
    EasyLoading.show(status: "Loading----");
    await controller5.AcceptOfferOnClick();
    if (controller5.status) {
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
    await controller6.RefuseOfferOnClick();
    if (controller6.status) {
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
