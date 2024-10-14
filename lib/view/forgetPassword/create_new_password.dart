import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/forget_password_controller.dart';

import '../../widget/custom_form_button.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/header.dart';

class CreateNewPassword extends StatelessWidget {
  GlobalKey<FormState> NewCreateFormKey = GlobalKey();
  ForgetController controller = ForgetController();
  CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Form(
        key: NewCreateFormKey,
        child: Column(
          children: [
            const Header(title: 'Create New Password'),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'code',
              hintText: 'Enter code',
              isDense: true,
              // obscureText: true,
              // suffixIcon: true,
              onChanged: (value) {
                controller.code = value;
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
                controller.confirm_password = value;
              },
            ),

            const SizedBox(height: 22),

            CustomFormButton(
              innerText: 'Create',
              onPressed: () {
                clickNewCreate();
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

  void clickNewCreate() async {
    EasyLoading.show(status: "Loading----");
    await controller.onClickNewCreate();
    if (controller.statusNewCreate) {
      EasyLoading.showSuccess("Success");
      Get.offAllNamed("/SignIn");
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
