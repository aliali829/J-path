import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../getx/controller/sign_up_controller.dart';
import '../../widget/custom_form_button.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/header.dart';

class ConfirmEmail extends StatelessWidget {
  ConfirmEmail({super.key});
  SignUpController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> ConfirmFormKey = GlobalKey();
    SignUpController controller = Get.find();
    Widget content = SingleChildScrollView(
      child: Form(
        key: ConfirmFormKey,
        child: Column(
          children: [
            const Header(title: 'Confirmation'),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Code',
              hintText: 'Enter code send to your email',
              isDense: true,
              onChanged: (value) {
                controller.code = value;
              },
            ),
            const SizedBox(height: 22),
            CustomFormButton(
              innerText: 'Confirm',
              onPressed: () {
                ClickConfirm();
              },
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
                    ),
                    child: content),
              )
            : content,
      ),
    );
  }

  void ClickConfirm() async {
    await controller.confirmOnClick();
    EasyLoading.show(status: "Loading");
    if (controller.ConfirmStatus) {
      EasyLoading.showSuccess("Success");
      Get.toNamed("/SignIn");
    } else {
      EasyLoading.showError("Error");
    }
  }
}
