import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../../../../../cache/cache_healper.dart';
import '../../../../../model/user.dart';

class ChangePasswordServices {
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.changePassword);
  ChangePassword(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
    }, body: {
      "old_password": user.old_password,
      "password": user.password,
      "password_confirmation": user.password_confirmation
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
