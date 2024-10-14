import 'package:http/http.dart' as http;
import 'package:untitled75/view/web/show_wallet/wallet_model.dart';

import '../../../../cache/cache_healper.dart';
import '../../../../services/service_config.dart';

class showBalanceService {
  var id;
  var message;
  var url = Uri.parse(ServiceConfig.domainNameServer + ServiceConfig.wallet);
  Future<List<MyWallet>> show_balance() async {
    var response = await http.post(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${CacheHelper().getData(key: "AdminToken")}"
    }, body: {
      "wallet_code": "${CacheHelper().getData(key: "wallet_code")}",
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<MyWallet> wallet = myWalletFromJson(response.body);
      //final List<dynamic> jsonResponse = jsonDecode(response.body);
      //final int id = jsonResponse[0]["id"];
      //UserInformation.Cpmpany_id = id;
      return wallet;
    } else {
      return [];
    }
  }
}
