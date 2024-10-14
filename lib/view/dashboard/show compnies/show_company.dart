import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/show%20compnies/accept_controller.dart';
import 'package:untitled75/view/dashboard/show%20compnies/controller_show_companies.dart';

showCompaniesController controller = Get.find();
AcceptCompanyController controller2 = Get.find();

class ShowCompanies extends StatelessWidget {
  const ShowCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() {
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
                color: Colors.orangeAccent,
              ),
              child: ListTile(
                //child: Text("${controller.companiesList[index].name}"),
                title: Text(
                  "${controller.companiesList[index].name}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
                          "${controller.companiesList[index].descr}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 700),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // clickAcceptCompany();
                            },
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      })),
    );
  }

  void clickAcceptCompany() async {
    EasyLoading.show(status: "Loading----");
    // await controller2.AcceptCompanyOnClick();
    if (controller2.status) {
      EasyLoading.showSuccess("sucses");
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
