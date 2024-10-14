import 'package:get/get.dart';
import 'package:untitled75/services/login_dash.dart';
import 'package:untitled75/services/logout_service.dart';

import '../../model/user.dart';
import '../../services/secure_storage.dart';
import '../../services/sign_in_services.dart';
import '../../view/dashboard/logout/log_out_dash_service.dart';

class SignInController extends GetxController {
  var email = "";
  var password = "";
  var SuperEmail = "";
  var SuperPassword = "";
  var CheckBoxState = false.obs;
  var signInStatus = false;
  var LogOutStatus = false;
  var LogOutDashStatus = false;
  var message;
  var token;
  SignInServices service = SignInServices();
  LogOutServices service2 = LogOutServices();
  LogInServices service3 = LogInServices();
  LogOutDashServices service4 = LogOutDashServices();
  void ChangeStateCheckBox() async {
    CheckBoxState(!CheckBoxState.value);
    SecureStorage storage = SecureStorage();
    String? test = await storage.read("token");
    print(test);
  }

  var LogInStatus = false;
  Future<void> SignInOnClick() async {
    User user = User(
      email: email,
      password: password,
    );
    signInStatus = await service.SignIn(user, CheckBoxState.value);
  }

  Future<void> LogInOnClick() async {
    User user = User(
      superEmail: SuperEmail,
      superPassword: SuperPassword,
    );
    LogInStatus = await service3.LogIn(user);
  }

  Future<void> LogOutClick() async {
    User user = User(
      token: token,
    );
    LogOutStatus = await service2.LogOut(user);
    message = service2.message;
  }

  Future<void> LogOutDashClick() async {
    LogOutDashStatus = await service4.LogOutDash();
    message = service4.message;
  }
}
