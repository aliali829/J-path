import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/services/User_information.dart';
import 'package:untitled75/view/dashboard/companies/all-companies_service.dart';
import 'package:untitled75/view/dashboard/companies/all_companies_controller.dart';
import 'package:untitled75/view/dashboard/companies/block_controller.dart';
import 'package:untitled75/view/dashboard/companies/false_companies_controller.dart';
import 'package:untitled75/view/dashboard/companies/false_companies_service.dart';
import 'package:untitled75/view/dashboard/companies/true_companies_comtroller.dart';
import 'package:untitled75/view/dashboard/companies/true_companies_service.dart';
import 'package:untitled75/view/dashboard/show%20compnies/service_show_companies.dart';

import '../show compnies/accept_controller.dart';
import '../show compnies/controller_show_companies.dart';
import 'active_detailes.dart';
import 'all_detailes.dart';
import 'block_detail.dart';
import 'com_detailes.dart';

//RefreshController _refreshController = RefreshController();

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
showCompaniesService service = Get.find();
showCompaniesActiveService service2 = Get.find();
showCompaniesBlockService service3 = Get.find();
showAllCompaniesService service4 = Get.find();
showCompaniesController controller = Get.find();
AcceptCompanyController controller2 = Get.find();
ShowCompaniesActiveController showCompaniesActiveController = Get.find();
BlockCompanyController controller4 = Get.find();
showCompaniesBlockController controller5 = Get.find();
showAllCompaniesController controller6 = Get.find();

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //   key: scaffoldKey,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DashBoard-Companies"),
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
          bottom: TabBar(
            onTap: (a) {},
            tabs: const [
              Text(" Companies  Pendiing "),
              Text(" Companies  Active "),
              Text(" Companies  Block "),
              Text(" All Companies  "),
              //Text("Companies Active"),
              //Text("Companies Block"),
              //Text(" All Companies "),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: [
              /////////////////////////////////////
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

              /////////////////////////////////////////
              SafeArea(child: Obx(() {
                if (showCompaniesActiveController.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                    itemCount:
                        showCompaniesActiveController.companiesList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 10, color: Colors.black),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(ActiveDetailes());
                            // controller2.id = controller.companiesList[index].id;
                          },
                          child: ListTile(
                            //child: Text("${controller.companiesList[index].name}"),
                            title: Text(
                              "${showCompaniesActiveController.companiesList[index].name}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "${showCompaniesActiveController.companiesList[index].serviceType}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      //"${controller.companiesList[index].id}",
                                      "${showCompaniesActiveController.companiesList[index].descr}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 33),
                                IconButton(
                                    onPressed: () {
                                      UserInformation.Cpmpany_id =
                                          showCompaniesActiveController
                                              .companiesList[index].id;
                                      clickBlockCompany();
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
                    });
              })),

              //////////////////////////////////////
              SafeArea(child: Obx(() {
                if (controller5.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller5.companiesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          /* UserInformation.Cpmpany_id =
                                              controller5.companiesList[index].id;*/
                          Get.to(BlockDetailes());
                          // controller2.id = controller.companiesList[index].id;
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "${controller5.companiesList[index].name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${controller5.companiesList[index].serviceType}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    //"${controller.companiesList[index].id}",
                                    "${controller5.companiesList[index].location}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 33),
                              IconButton(
                                  onPressed: () {
                                    UserInformation.Cpmpany_id =
                                        controller5.companiesList[index].id;
                                    clickAcceptCompany();
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

              /////////////////////////////////////////
              SafeArea(child: Obx(() {
                if (controller6.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: controller6.companiesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 10, color: Colors.black),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          /* UserInformation.Cpmpany_id =
                                      controller5.companiesList[index].id;*/
                          Get.to(AllDetailes());
                          // controller2.id = controller.companiesList[index].id;
                        },
                        child: ListTile(
                          //child: Text("${controller.companiesList[index].name}"),
                          title: Text(
                            "${controller6.companiesList[index].name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${controller6.companiesList[index].serviceType}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    //"${controller.companiesList[index].id}",
                                    "${controller6.companiesList[index].location}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Text(
                            "${controller6.companiesList[index].status}",
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

              ////////////////////////////////////
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

  void clickBlockCompany() async {
    EasyLoading.show(status: "Loading----");
    await controller4.BlockCompanyOnClick();
    if (controller4.status) {
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

  void delete() async {
    print(UserInformation.Cpmpany_id.toString());
  }
}
