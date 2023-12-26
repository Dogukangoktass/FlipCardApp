import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? userId;
  String? userFirstName;
  String? userLastName;
  String? eMail;
  String? password;

  User({
     this.userId,
     this.userFirstName,
     this.userLastName,
     this.eMail,
     this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userID"],
    userFirstName: json["userFirstName"],
    userLastName: json["userLastName"],
    eMail: json["eMail"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    //"userID": userId,
    "userFirstName": userFirstName,
    "userLastName": userLastName,
    "eMail": eMail,
    "password": password,
  };
}

class UserLoginVM{
  String? eMail;
  String? password;

  UserLoginVM({
    this.eMail,
    this.password,
  });

  factory UserLoginVM.fromJson(Map<String, dynamic> json) => UserLoginVM(
    eMail: json["eMail"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "eMail": eMail,
    "password": password,
  };

}