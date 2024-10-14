import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/model/user.dart';
import 'package:untitled75/services/confirm_service.dart';
import 'package:untitled75/services/sign_up_services.dart';

import '../../services/extra-service.dart';
import '../../view/web/homePage/pofile/change/service_change.dart';
import '../../view/web/show_wallet/service-wallet.dart';

WalletServices services3 = WalletServices();
ChangePasswordServices services4 = ChangePasswordServices();

class SignUpController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var checked = false.obs;
  void UpdateSecure(_obscureText) {
    // checked.value = !obscureText;
    checked.value = !checked.value;
    _obscureText = !_obscureText;
  }

  void UpdateDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month - 12, now.day - 30);
    final DateTime? pickedDate = await showDatePicker(
        context: Get.context!, firstDate: DateTime(1920), lastDate: now);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  var first_name = "";
  var last_name = "";
  var email = "";
  var password = "";
  var password_confirmation = "";
  var code = "";

  var signUpStatus = false;
  var ConfirmStatus = false;

  // var message;
  SignUpServices service = SignUpServices();
  ConfirmServices services2 = ConfirmServices();
  Future<void> signUpOnClick() async {
    //User user = User(email: email);
    User user = User(
      email: email,
    );
    signUpStatus = await service.SignUp(user);
    // message = service.message;
    /*if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }

  Future<void> confirmOnClick() async {
    User user = User(
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        code: code);
    ConfirmStatus = await services2.Confirm(user);
  }

  /*Future<void> CheckOnClick() async {
    //User user = User(email: email);
    User user = User(
      email: email,
    );
    signUpStatus = await service.SignUp(user);
    // message = service.message;
    /*if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }*/

  var name = "";
  var descr = "";
  var location = "";
  var service_type = "";
  var phone = "";
  var statusAdd = false;
  var selectedService = "".obs;

  void UpdateSelectedItem(String value) {
    selectedService.value = value;
  }

  ExtraServices service2 = ExtraServices();
  Future<void> onClickExtra() async {
    //User user = User(email: email);
    User user = User(
      //   email: email,
      name: name,
      location: location,
      descr: descr,
      phone: phone,
      service_type: service_type,
    );
    statusAdd = await service2.Extra(user);
    /* message = service.message;
    if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }

  var wallet_code = "";
  var statusWallet = false;
  Future<void> onClickWallet() async {
    //User user = User(email: email);
    User user = User(
      //   email: email,
      wallet_code: wallet_code,
    );
    statusWallet = await services3.Wallet(user);
    /* message = service.message;
    if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }

  var old_password = "";
  var statusChange = false;
  Future<void> onClickChangePassword() async {
    //User user = User(email: email);
    User user = User(
      //   email: email,
      old_password: old_password,
      password: password,
      password_confirmation: password_confirmation,
    );
    statusChange = await services4.ChangePassword(user);
    /* message = service.message;
    if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }
}
