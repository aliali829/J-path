import 'package:http/http.dart' as http;

import '../../../cache/cache_healper.dart';
import '../../../services/service_config.dart';
import 'offer_model.dart';

class showAllOffersService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowAllOffers);
  Future<List<Offer>> show_all_offers() async {
    var response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${CacheHelper().getData(key: "SuperToken")}"
      }, /*body: {
      "token": user.token,
    }*/
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<Offer> offers = offerFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return offers;
    } else {
      return [];
    }
  }
}
