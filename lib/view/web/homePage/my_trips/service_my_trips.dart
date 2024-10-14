import 'package:http/http.dart' as http;
import 'package:untitled75/view/web/homePage/my_trips/model_my_trips.dart';

import '../../../../cache/cache_healper.dart';
import '../../../../services/service_config.dart';

class showAdminOffersService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowAdminoffers);
  Future<List<AdminTrip>> show_all_offers() async {
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
      List<AdminTrip> Adminoffers = adminTripsFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return Adminoffers;
    } else {
      return [];
    }
  }
}
