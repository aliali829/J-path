import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';

import '../../../widget/already_have_an_account_widget.dart';
import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';
import '../../../widget/header.dart';

class SignUp extends StatelessWidget {
  SignUpController controller = Get.find();

  // const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpFormKey = GlobalKey();
    Widget content = SingleChildScrollView(
      child: Form(
        key: signUpFormKey,
        child: Column(
          children: [
            const Header(title: 'Sign-up'),

            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'first name',
              hintText: 'Your name',
              isDense: true,
              onChanged: (value) {
                controller.first_name = value;
              },
            ),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'last name',
              hintText: 'Your name',
              isDense: true,
              onChanged: (value) {
                controller.last_name = value;
              },
            ),
            const SizedBox(height: 16),
            //!Email
            CustomInputField(
              labelText: 'Email',
              hintText: 'Your email',
              isDense: true,
              onChanged: (value) {
                controller.email = value;
              },
            ),

            const SizedBox(height: 16),
            //! Password
            CustomInputField(
              labelText: 'Password',
              hintText: 'Your password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              onChanged: (value) {
                controller.password = value;
              },
            ),
            //! Confirm Password
            CustomInputField(
              labelText: 'Confirm Password',
              hintText: 'Confirm Your password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              onChanged: (value) {
                controller.password_confirmation = value;
              },
            ),
            const SizedBox(height: 22),

            CustomFormButton(
              innerText: 'Signup',
              onPressed: () {
                // Get.snackbar("Successful", "Registration Successfull");
                //controller.signUp();
                /*if (kIsWeb) {
                      Get.off(ConfirmEmail());
                    } else {
                      Get.off(ExtranInformation());
                    }*/

                clickSignUp();
              },
            ),
            const SizedBox(height: 30),
            const AlreadyHaveAnAccountWidget(),
            const SizedBox(height: 30),
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
            : content,
      ),
    );
  }

  void clickSignUp() async {
    EasyLoading.show(status: "Loading----");
    await controller.signUpOnClick();
    if (controller.signUpStatus) {
      EasyLoading.showSuccess("Success");
      Get.toNamed("/confirm");
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
}
