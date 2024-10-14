import 'package:http/http.dart' as http;
import 'package:untitled75/view/web/homePage/detailes_of_trips/model_detailes.dart';

import '../../../../cache/cache_healper.dart';
import '../../../../services/service_config.dart';

class showDetailesService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowDetailes);
  Future<List<TouristTrips>> showDetailes() async {
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
      List<TouristTrips> detailes =
          TouristTrips.fromJson(response.body as Map<String, dynamic>)
              as List<TouristTrips>;
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return detailes;
    } else {
      return [];
    }
  }
}
