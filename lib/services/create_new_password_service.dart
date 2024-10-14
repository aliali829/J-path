import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../model/user.dart';

class CreateNewPasswordServices {
  var message;
  var url = Uri.parse(
      ServiceConfig.domainNameServer + ServiceConfig.CreateNewPassword);
  Future<bool> NewCreate(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      //"email": user.email,
      "code": user.code,
      "password": user.password,
      "password_confirmation": user.password_confirmation
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse is List<dynamic>) {
        message = jsonResponse[0]["message"];
      } else {
        message = "The password field must be at least 6 characters";
      }

      // message = jsonResponse["errors"]["password"];

      return false;
    } else if (response.statusCode == 500) {
      message = "code wrong";
      return false;
    } else {
      message = "Server Error";
      return false;
    }
  }
}
