import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../model/user.dart';

class SignUpServices {
  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.SignUp);
  Future<bool> SignUp(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "email": user.email,
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
