import 'package:http/http.dart' as http;
import 'package:untitled75/services/service_config.dart';

import '../cache/cache_healper.dart';
import '../model/user.dart';

class ExtraServices {
  //var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.AddCompany);
  Future<bool> Extra(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
    }, body: {
      "name": user.name,
      "location": user.location,
      "descr": user.descr,
      "phone": user.phone,
      "service_type": "tourism_trips",

      //"email": user.email,
    });
    print(response.statusCode);
    print(response.body);
    //print("the token:");
    //print(UserInformation.Admin_Token.toString());
    if (response.statusCode == 200) {
      //Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
      //  message = jsonResponse["message"];

      return true;
    } else if (response.statusCode == 422) {
      return false;
    } else {
      return false;
    }
  }
}
