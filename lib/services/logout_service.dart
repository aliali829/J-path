import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../cache/cache_healper.dart';
import '../model/user.dart';

class LogOutServices {
  // var token;
  var message;
  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.LogOut);
  Future<bool> LogOut(User user) async {
    var response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
      }, /*body: {
      "token": user.token,
    }*/
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["success"];
      return true;
    } else if (response.statusCode == 422) {
      message = "error";
      return false;
    } else {
      message = "Server error";
      return false;
    }
  }
}
