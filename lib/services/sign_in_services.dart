import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled75/services/User_information.dart';
import 'package:untitled75/services/secure_storage.dart';
import 'package:untitled75/services/service_config.dart';

import '../cache/cache_healper.dart';
import '../model/user.dart';

class SignInServices {
  var Admintoken;
  var message;

  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.SignIn);
  Future<bool> SignIn(User user, bool checkBox) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "email": user.email,
      "password": user.password,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Admintoken = jsonResponse["token"][0];
      // UserInformation.Admin_Token = token;
      CacheHelper().saveData(key: "AdminToken", value: Admintoken);
      if (checkBox) {
        SecureStorage storage = SecureStorage();
        await storage.save("token", UserInformation.Admin_Token);
      }

      return true;
    } else if (response.statusCode == 422) {
      return false;
    } else {
      return false;
    }
  }
}
