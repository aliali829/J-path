import 'package:http/http.dart' as http;

import '../../../../cache/cache_healper.dart';
import '../../../../model/user.dart';
import '../../../services/service_config.dart';

class WalletServices {
  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.wallet);
  Wallet(User user) async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
    }, body: {
      "wallet_code": user.wallet_code,
    });
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
