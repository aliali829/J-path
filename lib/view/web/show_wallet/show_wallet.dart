import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../cache/cache_healper.dart';
import '../../../../getx/controller/sign_up_controller.dart';
import '../../../../widget/custom_form_button.dart';
import '../../../../widget/custom_input_field.dart';
import '../../../../widget/header.dart';

SignUpController controller = Get.find();

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> ConfirmFormKey = GlobalKey();
    SignUpController controller = Get.find();
    Widget content = SingleChildScrollView(
      child: Form(
        key: ConfirmFormKey,
        child: Column(
          children: [
            const Header(title: ' My Wallet '),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Wallet Code',
              hintText: 'Enter wallet code send to your email',
              isDense: true,
              onChanged: (value) {
                controller.wallet_code = value;
                CacheHelper().saveData(
                    key: "wallet_code", value: controller.wallet_code);
              },
            ),
            const SizedBox(height: 22),
            CustomFormButton(
              innerText: 'enter',
              onPressed: () {
                ClickWallet();
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

  void ClickWallet() async {
    await controller.onClickWallet();
    EasyLoading.show(status: "Loading");
    if (controller.statusWallet) {
      EasyLoading.showSuccess("Success");
      html.window.location.href = '/Balance';
      //Get.offNamed("/Balance");

      // Get.toNamed("/SignIn");
    } else {
      EasyLoading.showError("Error");
    }
  }
}
