import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/forget_password_controller.dart';

import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';
import '../../../widget/header.dart';

GlobalKey<FormState> forgetFormKey = GlobalKey();
ForgetController controller = Get.find();

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Form(
        key: forgetFormKey,
        child: Column(
          children: [
            const Header(title: 'Forget Password'),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Email',
              hintText: 'Your email ',
              isDense: true,
              onChanged: (value) {
                controller.email = value;
              },
            ),
            const SizedBox(height: 22),
            CustomFormButton(
              innerText: 'Enter',
              onPressed: () {
                // Get.off(CodeForget());
                clickEnterEmail();
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

  void clickEnterEmail() async {
    EasyLoading.show(status: "Loading----");
    await controller.onClickEnterEmail();
    if (controller.statusEnterEmail) {
      EasyLoading.showSuccess("Success");
      Get.offAllNamed("/create");
      /* if (kIsWeb) {
        Get.off(ConfirmEmail());
      } else {
        Get.off(ExtranInformation);
      }*/
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
