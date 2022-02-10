class RegisterRequestModel {
  RegisterRequestModel({
    this.fullname,
    this.username,
    this.phonenumber,
    this.email,
    this.password,
  });
  late final String? fullname;
  late final String? username;
  late final String? phonenumber;
  late final String? password;
  late final String? email;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    username = json['username'];
    phonenumber = json['phonenumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['username'] = username;
    _data['phonenumber'] = phonenumber;
    _data['email'] = email;
    _data['password'] = password;

    return _data;
  }
}
