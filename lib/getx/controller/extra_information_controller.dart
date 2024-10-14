/*class ExtraController extends GetxController {
  SignUpController controller = Get.find();
  var email = "";
  var name = "";
  var description = "";
  var country = "";
  var service_type = "";
  var phone_number = "";
  var status;
  var selectedService = "".obs;

  void UpdateSelectedItem(String value) {
    selectedService.value = value;
  }

  ExtraServices service = ExtraServices();
  Future<void> onClickExtra() async {
    //User user = User(email: email);
    User user = User(
      email: email,
      name: name,
      descr: description,
      service_type: service_type,
      phone: phone_number,
    );
    status = await service.Extra(user);
    /* message = service.message;
    if (message is List) {
      String temp = "";
      for (String s in message) temp += s + "\n";
      message = temp;
    }*/
  }
}*/
