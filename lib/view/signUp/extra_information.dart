import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';
import 'package:untitled75/view/signUp/confirm_email.dart';
import 'package:untitled75/widget/small_button.dart';

import '../../widget/custom_form_button.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/header.dart';

class ExtranInformation extends StatelessWidget {
  ExtranInformation({super.key});
  GlobalKey<FormState> ExtraFormKey = GlobalKey();
  final List<String> dropDownList = ["Tourist journy", "flightJourny", "gggg"];

  final List<String> Gender = ["Male", "Female"];

  DateTime? _selectedDate;

//   SignUpController controller = Get.find();
  SignUpController controller2 = Get.find();

  final formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget content = SingleChildScrollView(
      child: Form(
        key: ExtraFormKey,
        child: Column(
          children: [
            const Header(title: 'Add company'),

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
            CustomInputField(
              labelText: 'Country',
              hintText: 'country for your company',
              isDense: true,
              onChanged: (value) {
                controller2.location = value;
              },
              // controller: controller.signUpPhone,
            ),
            //!Email
            /*    CustomInputField(
              labelText: 'country',
              hintText: 'Your country',
              isDense: true,
              // controller: controller.signUpEmail,
            ),*/
            //  const SizedBox(height: 16),
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
              labelText: 'Service-type',
              hintText: 'enter service type',
              isDense: true,
              onChanged: (value) {
                controller2.service_type = value;
              },
            ),
            const SizedBox(height: 16),

            //!Email
            /*    CustomInputField(
              labelText: 'country',
              hintText: 'Your country',
              isDense: true,
              // controller: controller.signUpEmail,
            ),*/
            //  const SizedBox(height: 16),

            const SizedBox(height: 22),

            CustomFormButton(
              innerText: 'Save',
              onPressed: () {
                clickExtra();
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
    Widget content2 = SingleChildScrollView(
      child: Form(
        // key: controller.signUpFormKey,
        child: Column(
          children: [
            const Header(title: 'more_information'),

            const SizedBox(height: 16),
            /*Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              IconButton(
                onPressed: () {
                  controller.UpdateDate();
                },
                icon: const Icon(Icons.calendar_month),
              ),
              Obx(() {
                return Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.selectedDate.value)
                      .toString(),
                );
              })
            ]),

            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'annual income',
              hintText: 'enter your annual',
              isDense: true,
              //     controller: controller.signUpFirstName,
            ),*/

            /*   const SizedBox(height: 16),
            Obx(() {
              return Container(
                width: size.width * 0.9,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Selected Your Gender",
                    ),
                    isExpanded: true,
                    value: controller.selectedService.value == ""
                        ? null
                        : controller.selectedService.value,
                    onChanged: (newValue) {
                      controller.UpdateSelectedItem(newValue.toString());
                    },
                    items: Gender.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              );
            }),*/

            const SizedBox(height: 16),
            //!Email
            CustomInputField(
              labelText: 'country',
              hintText: 'Your country',
              isDense: true,

              //   controller: controller.signUpEmail,
            ),
            const SizedBox(height: 16),

            CustomInputField(
              labelText: 'Phone',
              hintText: 'enter your phone',
              isDense: true,
              // controller: controller.signUpPassword,
            ),

            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  innerText: "Skip",
                  onPressed: () {
                    Get.off(ConfirmEmail());
                  },
                ),
                const SizedBox(width: 30),
                SmallButton(
                  innerText: "Save",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xffEEF1F3),
        body: kIsWeb
            ? Center(
                child: Container(
                  width: 500,
                  height: 500,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    border: Border.all(width: 10, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    //color: Colors.grey.withOpacity(0.6),
                  ),
                  child: content,
                ),
              )
            : content2,
      ),
    );
  }

  void clickExtra() async {
    //controller.signUpOnClick();
    EasyLoading.show(status: "Loading----");
    await controller2.onClickExtra();
    if (controller2.statusAdd) {
      EasyLoading.showSuccess("Success");
      Get.offNamed("/MainPage");
    } else {
      EasyLoading.showError("Error"
          //  controller.message,
          // duration: Duration(seconds: 10),
          // dismissOnTap: true,
          );
    }
  }
}
