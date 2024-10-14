import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../cache/cache_healper.dart';
import '../model/user.dart';

class LogInServices {
  var Supertoken;
  var message;

  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.SignIn);
  Future<bool> LogIn(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "email": user.superEmail,
      "password": user.superPassword,
    });
    print(response.statusCode);
    print(response.body);
    // print(UserInformation.SuperAdmin_Token);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Supertoken = jsonResponse["token"][0];
      //UserInformation.SuperAdmin_Token = token;
      CacheHelper().saveData(key: "SuperToken", value: Supertoken);

      return true;
    } else if (response.statusCode == 422) {
      return false;
    } else {
      return false;
    }
  }
}
