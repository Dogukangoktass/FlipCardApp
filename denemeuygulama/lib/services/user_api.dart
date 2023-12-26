import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
class UserApi{


  Future<User> loginPostasd(String email, String password) async
  {
    Map<String, dynamic> request={
      "email":email,
      "password":password
    };
    final uri = Uri.parse("https://webapi20231207005716.azurewebsites.net/api/User/Login");
    final response= await http.post(uri,body: request);

    if(response.statusCode==201){ return User.fromJson(json.decode(response.body));}
    else {throw Exception("failed to load post");}
  }
/*
  Future<http.Response> loginPost(String email, String password) {
    return http.post(
      Uri.parse('https://webapi20231207005716.azurewebsites.net/api/User/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
  }*/


  /*
  void UserLogin(String email, String password) async{
    var apiUrl = 'https://webapi20231207005716.azurewebsites.net/api/User/Login';
    // Kullanıcı bilgileri
    // HTTP isteği için kullanıcı bilgileri içeren bir harita (map) oluşturun
    var requestBody = {'email': email, 'password': password};

    // HTTP POST isteği yapma
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    // Yanıtın işlenmesi
    if (response.statusCode == 200) {
      // Başarılı giriş
      var jsonResponse = json.decode(response.body);
      print('Giriş başarılı: ${jsonResponse['token']}');
    } else {
      // Hata durumu
      var jsonResponse = json.decode(response.body);
      print('Giriş başarısız: ${jsonResponse['error']}');
    }

  } */









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