import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/active_user_detaile.dart';
import 'package:untitled75/view/dashboard/Users/all_users_controller.dart';
import 'package:untitled75/view/dashboard/Users/block_user_detail.dart';
import 'package:untitled75/view/dashboard/Users/false_users_controller.dart';
import 'package:untitled75/view/dashboard/Users/show_users_controller.dart';
import 'package:untitled75/view/dashboard/Users/un_block_user_controller.dart';
import 'package:untitled75/view/dashboard/Users/user_detale.dart';

import '../../../services/User_information.dart';
import 'block_user_controller.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
showCustomersActiveController controller = Get.find();
BlockCustomerController controller2 = Get.find();
showAllCustomersController controller3 = Get.find();
showCustomersBlockController controller4 = Get.find();
UnBlockUserController controller5 = Get.find();

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //   key: scaffoldKey,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DashBoard-Users"),
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
              Text("Users Active"),
              Text("Users Block"),
              Text(" All Users "),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: [
              /////////////////////////////
              SafeArea(child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller.customersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(ActiveUserDetailes());
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "${controller.customersList[index].firstName}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${controller.customersList[index].lastName}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  /*Text(
                                    //"${controller.companiesList[index].id}",
                                    "${controller.customersList[index].location}",
                                    style: TextStyle(color: Colors.black),
                                  ),*/
                                ],
                              ),
                              const SizedBox(width: 33),
                              IconButton(
                                  onPressed: () {
                                    UserInformation.User_id =
                                        controller.customersList[index].id;
                                    // print(UserInformation.User_id);
                                    clickBlockCustomers();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  )),
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
                if (controller4.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller4.customersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(BlockUserDetailes());
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "${controller4.customersList[index].firstName}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${controller4.customersList[index].lastName}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 33),
                              IconButton(
                                  onPressed: () {
                                    UserInformation.User_id =
                                        controller4.customersList[index].id;
                                    clickUnBlockUser();
                                    //  clickAcceptCompany();
                                  },
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )),
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
                if (controller3.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller3.customersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(UseDetailes());
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "${controller3.customersList[index].firstName}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${controller3.customersList[index].lastName}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  /*Text(
                                    //"${controller.companiesList[index].id}",
                                    "${controller.customersList[index].location}",
                                    style: TextStyle(color: Colors.black),
                                  ),*/
                                ],
                              ),
                            ],
                          ),
                          trailing: Text(
                            "${controller3.customersList[index].status}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                );
              })),
            ],
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

  void clickUnBlockUser() async {
    EasyLoading.show(status: "Loading----");
    await controller5.UnBlockUserOnClick();
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
}
