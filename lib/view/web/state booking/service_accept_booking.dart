import 'package:http/http.dart' as http;

import '../../../../../cache/cache_healper.dart';
import '../../../services/User_information.dart';
import '../../../services/service_config.dart';

class acceptBookingServices {
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.acceptBooking);
  Future<bool> acceptBooking() async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
    }, body: {
      "id": UserInformation.booking_id.toString(),
    });
    print(UserInformation.booking_id.toString());
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
