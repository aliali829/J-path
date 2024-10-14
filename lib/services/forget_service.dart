import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../model/user.dart';

class ForgetServices {
  var message;
  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.check);
  Future<bool> enterEmail(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "email": user.email,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];

      return true;
    } else if (response.statusCode == 422) {
      Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
      message = jsonResponse["errors"]["email"];
      return false;
    } else {
      message = "Server Error";
      return false;
    }
  }
}
