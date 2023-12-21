import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
class UserApi{

  Future<User> UserRegister(String email, String password, String firstName, String lastName)
   async {
    Map<String, dynamic> request={
      'userFirstName': firstName,
      'userLastName': lastName,
      'eMail': email,
      'password':password,
    };

    final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/User/Register");
    final response=await http.post(uri, body: request);

    if(response.statusCode==201) return User.fromJson(json.decode(response.body));

    else throw Exception("failed to register");

  }


}