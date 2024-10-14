import 'package:get/get.dart';
import 'package:untitled75/view/web/show_wallet/service_balance.dart';
import 'package:untitled75/view/web/show_wallet/wallet_model.dart';

class showBalanceController extends GetxController {
  showBalanceService service = showBalanceService();
  List<MyWallet> walletList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    walletList = await service.show_balance();

    isLoading(false);
    super.onReady();
  }
}
