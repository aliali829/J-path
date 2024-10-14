import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';

import '../../../../../widget/custom_form_button.dart';
import '../../../../../widget/custom_input_field.dart';
import '../../../../../widget/header.dart';

SignUpController controller = SignUpController();
GlobalKey<FormState> NewCreateFormKey = GlobalKey();

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Form(
        key: NewCreateFormKey,
        child: Column(
          children: [
            const Header(title: 'Change Password'),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'old password',
              hintText: 'Enter old password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              onChanged: (value) {
                controller.old_password = value;
              },
            ),
            const SizedBox(height: 16),
            //! Password
            CustomInputField(
              labelText: 'New Password',
              hintText: 'Your New password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              onChanged: (value) {
                controller.password = value;
              },
            ),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Confirm New Password',
              hintText: 'Confirm Your New password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              onChanged: (value) {
                controller.password_confirmation = value;
              },
            ),

            const SizedBox(height: 22),

            CustomFormButton(
              innerText: 'Create',
              onPressed: () {
                clickChangePassword();
              },
            ),
          ],
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
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
                  child: content,
                ),
              )
            : content,
      ),
    );
  }

  void clickChangePassword() async {
    EasyLoading.show(status: "Loading----");
    await controller.onClickChangePassword();
    if (controller.statusChange) {
      EasyLoading.showSuccess("Success");
      Get.offAllNamed("/MainPage");
    } else {
      EasyLoading.showError(
        "error", duration: const Duration(seconds: 6),
        dismissOnTap: true,
        //  controller.message,
        // duration: Duration(seconds: 10),
        // dismissOnTap: true,
      );
    }
  }
}
