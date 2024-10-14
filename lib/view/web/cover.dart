import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_in_controller.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';
import 'package:untitled75/view/dashboard/show%20compnies/accept_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/User_information.dart';
import '../../widget/custom_form_button.dart';
import '../../widget/custom_input_field.dart';

SignInController controller = Get.find();
SignUpController controller2 = Get.find();
AcceptCompanyController controller3 = Get.find();

class Cover extends StatelessWidget {
  const Cover({super.key});

  @override
  Widget build(BuildContext context) {
    //SignInController controller = Get.find();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepOrange,
              Colors.orangeAccent,
            ]),
      ),
      child: Column(
        children: [
          Form(
            //key: ExtraFormKey,
            child: Column(
              children: [
                // const Header(title: 'Add company'),

                const SizedBox(height: 16),
                CustomInputField(
                  labelText: 'company name',
                  hintText: 'name of your company',
                  isDense: true,
                  // controller: controller2.name,
                  onChanged: (value) {
                    controller2.name = value;
                  },
                ),

                /*Obx(() {
                    return Container(
                      width: size.width * 0.9,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Selected Type service",
                            focusColor: Colors.white,
                            // border: InputBorder.none,
                          ),
                          //isExpanded: true,
                          value: controller2.selectedService.value == ""
                              ? null
                              : controller2.selectedService.value,
                          onChanged: (newValue) {
                            controller2.UpdateSelectedItem(newValue.toString());
                          },
                          items: controller2.service_type
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),
                    );
                  }),*/

                const SizedBox(height: 16),
                //!Email
                /*    CustomInputField(
                    labelText: 'country',
                    hintText: 'Your country',
                    isDense: true,
                    // controller: controller.signUpEmail,
                  ),*/
                //  const SizedBox(height: 16),

                /*CustomInputField(
                  labelText: 'Service-type',
                  hintText: 'enter service type',
                  isDense: true,
                  onChanged: (value) {
                    controller2.service_type = value;
                  },
                ),*/
                // const SizedBox(height: 16),
                //!Email
                /*    CustomInputField(
                    labelText: 'country',
                    hintText: 'Your country',
                    isDense: true,
                    // controller: controller.signUpEmail,
                  ),*/
                //  const SizedBox(height: 16),

                CustomInputField(
                  labelText: 'Phone',
                  hintText: 'phone of company',
                  isDense: true,
                  onChanged: (value) {
                    controller2.phone = value;
                  },
                  //controller: controller.signUpPassword,
                ),
                const SizedBox(height: 16),

                CustomInputField(
                  labelText: 'Description',
                  hintText: 'Description for your company',
                  isDense: true,
                  onChanged: (value) {
                    controller2.descr = value;
                  },
                  // controller: controller.signUpPhone,
                ),
                const SizedBox(height: 16),

                CustomInputField(
                  labelText: 'Country',
                  hintText: 'country for your company',
                  isDense: true,
                  onChanged: (value) {
                    controller2.location = value;
                  },
                  // controller: controller.signUpPhone,
                ),

                const SizedBox(height: 22),

                CustomFormButton(
                  innerText: 'Save',
                  onPressed: () {
                    // Get.snackbar("Successful", "Registration Successfull");
                    //controller.signUp();
                    // Get.off(ConfirmEmail());
                    //clickSignUp();
                    // Get.off(SignIn());
                    controller.token = UserInformation.Admin_Token;
                    clickExtra();
                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
    /* : AspectRatio(
            aspectRatio: 1.7,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/cover.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nothing Develops Intelligence \n Like Travel! ",
                          style: Responseve.isStanderdWeb(context)
                              ? const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: JPathColors.text1,
                                )
                              : const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: JPathColors.text1,
                                ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  //Get.off(SignUp());
                                  Get.offAllNamed("/SignIn");
                                },
                                child: const Text("Sign_In")),
                            IconButton(
                                onPressed: () {
                                  opendashboard();
                                },
                                icon: Icon(
                                  Icons.web,
                                  size: 15,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          );*/
  }

  void clickExtra() async {
    //controller.signUpOnClick();
    EasyLoading.show(status: "Loading----");
    await controller2.onClickExtra();
    if (controller2.statusAdd) {
      EasyLoading.showSuccess("Success");
      html.window.location.href = '/MainPage';
      //Get.offNamed("/MainPage");
      /* if (kIsWeb) {
        Get.off(ConfirmEmail());
      } else {
        Get.off(ExtranInformation);
      }*/
    } else {
      EasyLoading.showError("Error"
          //  controller.message,
          // duration: Duration(seconds: 10),
          // dismissOnTap: true,
          );
    }
  }

  void opendashboard() async {
    final url = Uri.base.origin + '/WebScreen';
    if (await canLaunch(url)) {
      await launch(url, webOnlyWindowName: '_blank');
    } else {
      throw 'Could not launch $url';
    }
  }
}
