import 'package:http/http.dart' as http;

import '../../../cache/cache_healper.dart';
import '../../../services/service_config.dart';
import 'mode_booking.dart';

class showAllBookingsService {
  var id;
  var message;
  var url =
      Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.ShowAllBookings);
  Future<List<Booking>> show_all_bookings() async {
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
      List<Booking> bookings = bookingFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return bookings;
    } else {
      return [];
    }
  }
}
