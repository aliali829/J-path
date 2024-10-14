import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../model/user.dart';

class ConfirmServices {
  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.Confirm);
  Confirm(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "email": user.email,
      "password": user.password,
      "confirm_password": user.password_confirmation,
      "first_name": user.first_name,
      "last_name": user.last_name,
      "code": user.code,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 422) {
      return false;
    } else {
      return false;
    }
  }
}
