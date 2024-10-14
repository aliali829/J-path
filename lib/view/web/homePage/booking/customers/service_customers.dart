import 'package:http/http.dart' as http;
import 'package:untitled75/view/web/homePage/booking/customers/model_customers.dart';

import '../../../../../cache/cache_healper.dart';
import '../../../../../services/User_information.dart';
import '../../../../../services/service_config.dart';

class showMyCustomeService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowMyCustomers);
  Future<List<Admincustomers>> showMycustome() async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
    }, body: {
      // "token": user.token,
      "id": UserInformation.offer_id.toString(),
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<Admincustomers> admincustomers =
          admincustomersFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return admincustomers;
    } else {
      return [];
    }
  }
}
