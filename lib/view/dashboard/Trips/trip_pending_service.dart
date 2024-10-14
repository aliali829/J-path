import 'package:http/http.dart' as http;
import 'package:untitled75/view/dashboard/Trips/offer_model.dart';

import '../../../cache/cache_healper.dart';
import '../../../services/service_config.dart';

class showOffersPendingService {
  var id;
  var message;
  var url = Uri.parse(
      ServiceConfig.domainNameServer + ServiceConfig.ShowOfferPending);
  Future<List<Offer>> show_offers() async {
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
