import 'package:http/http.dart' as http;
import 'package:untitled75/view/web/showCompany/show_company_admin_model.dart';

import '../../../../cache/cache_healper.dart';
import '../../../../services/service_config.dart';
import '../../../services/helper_api_service.dart';
import '../../../services/log_api.dart';

class ShowMyCompanyService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowMyCompany);

  Future<List<ShowCompany>> showMycompany() async {
    var response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
      }, /*body: {
      "token": user.token,
    }*/
    );
    logResponse(
        url: ServiceConfig.domainNameServer,
        response: response,
        type: ApiType.get);

    if (response.statusCode == 200) {
      List<ShowCompany> companies = showCompanyFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return companies;
    } else {
      return [];
    }
  }
}
