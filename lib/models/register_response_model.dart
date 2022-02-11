import 'dart:convert';

RegisterResponseModel registerResponseJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.fullname,
    required this.email,
    required this.username,
    required this.phonenumber,
    required this.password,
    required this.date,
    required this.id,
  });
  late final String username;
  late final String email;
  late final String fullname;
  late final String phonenumber;
  late final String password;
  late final String date;
  late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['fullname'] = fullname;
    _data['phonenumber'] = phonenumber;
    _data['password'] = password;
    _data['date'] = date;
    _data['id'] = id;
    return _data;
  }
}
