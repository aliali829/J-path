import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_in_controller.dart';
import 'package:untitled75/widget/custom_checckBox.dart';
import 'package:untitled75/widget/header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';
import '../../../widget/dont_have_an_account.dart';
import '../../../widget/forget_password_widget.dart';
import '../../cache/cache_healper.dart';
import '../dashboard/login.dart';

var token = CacheHelper().getData(key: "SuperToken");

class SignIn extends StatelessWidget {
  SignInController controller = Get.find();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInFormKey = GlobalKey();
    SignInController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    Widget content = SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                if (token != null && token != "") {
                  Get.offNamed("/DashBoard");
                }
                Get.offAll(Login());
              },
              icon: Icon(Icons.dashboard_customize)),
          IconButton(onPressed: _launchURL, icon: Icon(Icons.add)),
          Form(
            key: signInFormKey,
            child: Column(
              children: [
                Header(title: "Sign-in"),
                const SizedBox(width: 16),

                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email',
                  isDense: true,
                  onChanged: (value) {
                    controller.email = value;
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
                    controller.password = value;
                  },
                  // controller: context.read<UserCubit>().signUpPassword,
                ),

                const SizedBox(height: 16),

                const SizedBox(height: 16),
                //! Forget password?
                ForgetPasswordWidget(size: size),
                const SizedBox(height: 16),

                const SizedBox(height: 22),
                //!Sign Up Button
                //state is SignUpLoading
                //? CircularProgressIndicator()
                CustomFormButton(
                  innerText: 'SignIn',
                  onPressed: () {
                    /*if (kIsWeb) {
                      Get.off(WebScreen());
                    }*/
                    //context.read<UserCubit>().signUp();
                    clickSignIn();
                  },
                ),
                const SizedBox(height: 18),

                DontHaveAnAccountWidget(size: size),
                const SizedBox(height: 18),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return CustomCheckBox(
                  size: 25,
                  iconSize: 20,
                  isSelected: controller.CheckBoxState.value,
                  onTap: () {
                    controller.ChangeStateCheckBox();
                  },
                );
              }),
              SizedBox(width: 10),
              Text("Keep"),
            ],
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

  void clickSignIn() async {
    EasyLoading.show(status: "Loading----");
    await controller.SignInOnClick();
    if (controller.signInStatus) {
      EasyLoading.showSuccess("sucses");

      //controller.token = UserInformation.User_Token;
      /*    if (kIsWeb) {
        Get.off(WebScreen());
      } else {
        Get.off(MobileHome());
      }*/
      html.window.location.href = '/WebScreen';
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

  void opendashboard() {
    var url = Uri.base.origin + '/SignUp';
    html.window.open(url, "_blank");
  }

  void _launchURL() async {
    var url = Uri.base.origin + '/LogIn'; // رابط الصفحة التي تريد فتحها
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
