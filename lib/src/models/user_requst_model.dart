// import 'package:contacts_app/src/core/network/api_helper.dart';

class UserRequestModel {
  final String name;
  final String email;
  final String dob;
  final String phoneNo;
  final String password;

  UserRequestModel(
      {required this.name,
      required this.email,
      required this.dob,
      required this.phoneNo,
      required this.password});

  factory UserRequestModel.fromJSON(Map<String, dynamic> json) {
    return UserRequestModel(
        name: json['name'],
        email: json['email'],
        dob: json['dob'],
        phoneNo: json['phone'],
        password: json['password']);
  }
  Map<String, dynamic> toJSON() {
    return {
      "name": this.name,
      "email": this.email,
      "dob": this.dob,
      "phone": this.phoneNo,
      "password": this.password
    };
  }
}
