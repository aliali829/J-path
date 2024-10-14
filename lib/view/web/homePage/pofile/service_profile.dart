import 'package:http/http.dart' as http;

import '../../../../cache/cache_healper.dart';
import '../../../../services/service_config.dart';
import 'model_profile.dart';

class showProfileService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowProfile);
  Future<List<Profile>> showProfile() async {
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
      List<Profile> profile = profileFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return profile;
    } else {
      return [];
    }
  }
}
