import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_in_controller.dart';
import 'package:untitled75/widget/header.dart';

import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';
import '../../../widget/dont_have_an_account.dart';

SignInController controller = Get.find();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInFormKey = GlobalKey();
    SignInController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    Widget content = SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: signInFormKey,
            child: Column(
              children: [
                Header(title: "DashBoard"),
                const SizedBox(width: 16),

                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email',
                  isDense: true,
                  onChanged: (value) {
                    controller.SuperEmail = value;
                  },
                  // controller: context.read<UserCubit>().signUpEmail,
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
                    controller.SuperPassword = value;
                  },
                  // controller: context.read<UserCubit>().signUpPassword,
                ),

                //! Forget password?

                const SizedBox(height: 22),
                //!Sign Up Button
                //state is SignUpLoading
                //? CircularProgressIndicator()
                CustomFormButton(
                  innerText: 'LogIn',
                  onPressed: () {
                    /*if (kIsWeb) {
                      Get.off(WebScreen());
                    }*/
                    //context.read<UserCubit>().signUp();
                    clickLogIn();
                  },
                ),
                const SizedBox(height: 18),

                DontHaveAnAccountWidget(size: size),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ],
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

  void clickLogIn() async {
    EasyLoading.show(status: "Loading----");
    await controller.LogInOnClick();
    if (controller.LogInStatus) {
      EasyLoading.showSuccess("sucses");
      Get.offNamed("/DashBoard");
      //controller.token = UserInformation.SuperAdmin_Token;
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
