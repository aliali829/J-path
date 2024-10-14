import 'package:http/http.dart' as http;
import 'package:untitled75/services/User_information.dart';
import 'package:untitled75/services/service_config.dart';

import '../../../cache/cache_healper.dart';

class AcceptCompanyServices {
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.AcceptCompany);
  Future<bool> AcceptCompany() async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "SuperToken")}"
    }, body: {
      "id": UserInformation.Cpmpany_id.toString(),
    });
    // print(company.id);
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
