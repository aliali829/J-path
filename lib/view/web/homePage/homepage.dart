import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/web/homePage/pofile/controller_profile.dart';

import '../../../getx/controller/create_trip_controller.dart';
import '../../../getx/controller/sign_in_controller.dart';
import '../../../services/User_information.dart';
import '../../../theme/service_theme.dart';
import '../showCompany/show_company_admin_c.dart';
import '../showCompany/show_company_admin_model.dart';
import '../state booking/controller_accept_booking.dart';
import '../state booking/controller_booking.dart';
import '../state booking/controller_refuse_booking.dart';
import 'booking/customers/controller_customers.dart';
import 'delete_company/delete_company_controller.dart';
import 'delete_trip/controller_delete_trip.dart';
import 'my_trips/controller_my_trips.dart';

CreateTripController tripsController = Get.find();
ShowMyCompanyController showMyCompanyController = Get.find();
DeleteCompanyController controller2 = Get.find();
showMyProfileController controller3 = Get.find();
SignInController controller4 = Get.find();
showAdminOffersController controller5 = Get.find();
DeleteTripController controller6 = Get.find();
showMyCustomeController controller7 = Get.find();
CreateTripController createTripController = Get.find();
showAllBookingsController controller8 = Get.find();
acceptBookingController controller10 = Get.find();
refuseBookingController controller11 = Get.find();
//====================
ShowCompany? myCompany;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("J-path"),
            actions: [
              IconButton(
                  onPressed: () {
                    window.location.reload();
                  },
                  icon: Icon(Icons.refresh))
            ],
            bottom: const TabBar(tabs: [
              Row(
                children: [
                  Icon(
                    Icons.store,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text("My Commapany"),
                ],
              ),

              //=================================

              Row(
                children: [
                  Icon(
                    Icons.park_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(width: 5),
                  Text("My Trips"),
                ],
              ),
              //=================================
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text("My Reservations"),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.grey),
                  SizedBox(width: 5),
                  Text("My profile"),
                ],
              ),
            ]),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: TabBarView(
              children: [
                //Center(child: Text("My Commapany")),
                SafeArea(child: Obx(() {
                  if (showMyCompanyController.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return ListView.builder(
                    itemCount: showMyCompanyController.companiesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    UserInformation.Cpmpany_id =
                                        showMyCompanyController
                                            .companiesList[index].id;
                                    clickDeleteCompany();
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  )),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () {
                                    Get.toNamed("/Wallet");
                                  },
                                  icon: Icon(
                                    Icons.monetization_on,
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                          //PickImageWidget(),
                          SizedBox(height: 10),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.store),
                                Text(
                                    "${showMyCompanyController.companiesList[index].name}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.language),
                                Text(
                                    "${showMyCompanyController.companiesList[index].location}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.description),
                                Text(
                                    "${showMyCompanyController.companiesList[index].descr}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.tour),
                                Text(
                                    "${showMyCompanyController.companiesList[index].serviceType}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.phone),
                                Text(
                                    "${showMyCompanyController.companiesList[index].phone}"),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                })),
                //======================================================

                Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed("/CreateTripPage", arguments: null);
                    },
                    child: Icon(Icons.add, color: Colors.white),
                    backgroundColor: Get.theme.primaryColor,
                  ),
                  body: SafeArea(child: Obx(() {
                    if (controller5.isLoading.isTrue) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller5.TripsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/tripAdDetailes",
                                  arguments: controller5.TripsList[index].id);
                            },
                            child: ListTile(
                                trailing: //Text(
                                    //"${controller7.customersList[index].id}"),

                                    IconButton(
                                        onPressed: () {
                                          UserInformation.offer_id =
                                              controller5.TripsList[index].id;
                                          clickDeleteTrip();
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                        )),

                                //SizedBox(width: 5),
                                /*Text(
                                      "${controller5.TripsList[index].status}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),*/

                                //child: Text("${controller.companiesList[index].name}"),
                                title: Text(
                                  "From: ${controller5.TripsList[index].source}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(children: [
                                  Column(
                                    children: [
                                      Text(
                                        "To: ${controller5.TripsList[index].destination}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "${controller5.TripsList[index].status}",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ])),
                          ),
                        );
                      },
                    );
                  })),
                ),

                //===================================
                SafeArea(child: Obx(() {
                  if (controller8.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller8.bookingsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 10, color: Colors.black),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            //Get.to(ComDetailes());
                            // controller2.id = controller.companiesList[index].id;
                          },
                          child: ListTile(
                            //child: Text("${controller.companiesList[index].name}"),
                            title: Text(
                              "${controller8.bookingsList[index].numberOfPeople}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "${controller8.bookingsList[index].totalPrice}\$",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    /*Text(
                                      //"${controller.companiesList[index].id}",
                                      "${UserInformation.Cpmpany_id}",
                                      style: TextStyle(color: Colors.black),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(width: 700),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          UserInformation.booking_id =
                                              controller8
                                                  .bookingsList[index].id;
                                          clickacceptBooking();
                                          //clickAcceptCompany();
                                        },
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          UserInformation.booking_id =
                                              controller8
                                                  .bookingsList[index].id;
                                          //clickBlockCompany();
                                          clickrefuseBooking();
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
                //=======================================v  =====
                /*SafeArea(child: Obx(() {
                  if (controller7.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller7.customersList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 10, color: Colors.black),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          title: Text(
                            "From: ${controller7.customersList[index].numberOfPeople}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "To: ${controller7.customersList[index].id}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  );
                })),*/

                //=======================================================
                SafeArea(child: Obx(() {
                  if (controller3.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller3.ProfileList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.account_circle),
                                Text(
                                    "${controller3.ProfileList[index].firstName}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.account_circle),
                                Text(
                                    "${controller3.ProfileList[index].lastName}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.email),
                                Text("${controller3.ProfileList[index].email}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card(
                            child: Row(
                              children: [
                                Icon(Icons.phone),
                                Text(
                                    "${controller3.ProfileList[index].phoneNumber}"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            onTap: () {
                              Get.toNamed("/ChangePassword");
                            },
                            trailing: const Text("Change Password"),
                            leading: Icon(Icons.change_circle_outlined),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            onTap: () {
                              serviceMoon().changeTheme();
                            },
                            trailing: const Text("Dark mode"),
                            leading:
                                Icon(Icons.dark_mode_sharp, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            onTap: () {
                              controller4.token = UserInformation.Admin_Token;
                              clickLogout();
                            },
                            leading: const Text("Log-out"),
                            trailing: Icon(Icons.logout,
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ],
                      );
                    },
                  );
                })),
                //===========================================================
              ],
            ),
          ),
        ));
  }

  void clickDeleteCompany() async {
    EasyLoading.show(status: "Loading----");
    await controller2.DeleteCompanyOnClick();
    if (controller2.status) {
      EasyLoading.showSuccess("sucses");
      Get.offAllNamed("/SignIn");
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

  void clickDeleteTrip() async {
    EasyLoading.show(status: "Loading----");
    await controller6.DeleteTripOnClick();
    if (controller6.status) {
      EasyLoading.showSuccess("sucses");
      //Get.offNamed("/SignIn");
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

  void clickLogout() async {
    EasyLoading.show(status: "Loading----");
    await controller4.LogOutClick();
    if (controller4.LogOutStatus) {
      EasyLoading.showSuccess(controller4.message);
      Get.offAllNamed("/SignUp");
    } else {
      EasyLoading.showError(controller4.message,
          duration: const Duration(seconds: 6), dismissOnTap: true);
    }
  }

  void clickacceptBooking() async {
    EasyLoading.show(status: "Loading----");

    await controller10.acceptBookingOnClick();
    if (controller10.status) {
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

  void clickrefuseBooking() async {
    EasyLoading.show(status: "Loading----");
    await controller11.refuseBookingOnClick();
    if (controller11.status) {
      EasyLoading.showSuccess("sucses");
      window.location.reload();
    } else {
      EasyLoading.showError(
        "error",
        duration: const Duration(seconds: 6),
        dismissOnTap: true,
      );
    }
  }
}
