class User {
  String? first_name;
  String? last_name;
  String? email;
  String? password;
  String? old_password;
  String? superEmail;
  String? superPassword;
  String? password_confirmation;
  String? code;
  String? token;
  String? name;
  String? descr;
  String? location;
  String? phone;
  String? service_type;
  String? wallet_code;
  User(
      {this.first_name,
      this.last_name,
      this.email,
      this.password,
      this.password_confirmation,
      this.name,
      this.descr,
      this.location,
      this.phone,
      this.service_type,
      this.code,
      this.token,
      this.superEmail,
      this.superPassword,
      this.wallet_code,
      this.old_password});

  @override
  String toString() {
    return 'User{first_name: $first_name,\n'
        ' last_name: $last_name,\n'
        ' email: $email,\n'
        ' password: $password,\n'
        ' confirm_password: $password_confirmation,\n'
        ' code: $code,\n'
        ' token: $token}';
  }
}
