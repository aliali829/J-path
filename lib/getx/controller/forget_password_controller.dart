import 'package:get/get.dart';
import 'package:untitled75/services/code_forget_service.dart';
import 'package:untitled75/services/create_new_password_service.dart';
import 'package:untitled75/services/forget_service.dart';

import '../../model/user.dart';

class ForgetController extends GetxController {
  var email = "";
  var code = "";
  var password = "";
  var confirm_password = "";
  var first_name = "";
  var last_name = "";
  var statusEnterEmail;
  var statusEnterCode;
  var statusNewCreate;
  var message;
  var messageChange;
  ForgetServices service = ForgetServices();
  CodeForgetServices service2 = CodeForgetServices();
  CreateNewPasswordServices service3 = CreateNewPasswordServices();
  Future<void> onClickEnterEmail() async {
    //User user = User(email: email);
    User user = User(
      email: email,
    );
    statusEnterEmail = await service.enterEmail(user);
    message = service.message;
    if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  Future<void> onClickEnterCode() async {
    //User user = User(email: email);
    User user = User(
      code: code,
      email: email,
      password: password,
      password_confirmation: confirm_password,
      first_name: first_name,
      last_name: last_name,
    );
    statusEnterCode = await service2.enterCode(user);
    // message = service.message;
    /*if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }

  Future<void> onClickNewCreate() async {
    //User user = User(email: email);
    User user = User(
      // email: email,
      code: code,
      password: password,
      password_confirmation: confirm_password,
    );
    statusNewCreate = await service3.NewCreate(user);
    messageChange = service3.message;
    /* if (messageChange is List) {
      String temp = "";
      for (String s in messageChange) temp += s + "\n";
      messageChange = temp;
    }*/
  }
}
