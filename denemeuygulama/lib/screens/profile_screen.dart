import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/drawer.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../models/user.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userId});
  final int userId;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  void profilDoldur() async {
    final uri = Uri.parse("https://webapi20231207005716.azurewebsites.net/api/User/GetUser/${widget.userId}");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      User user = User.fromJson(data);

      setState(() {
        firstName = user.userFirstName.toString();
        lastName = user.userLastName.toString();
        email = user.eMail.toString();
        password = user.password.toString();
      });
    } else {
      print("API çağrısı başarısız oldu: ${response.statusCode}");
    }
  }

  void updateProfile(String newFirstName, String newLastName, String newEmail, String newPassword) async {
    final uri = Uri.parse("https://webapi20231207005716.azurewebsites.net/api/User/ProfileUpdate?id=${widget.userId}&userFirstName=${newFirstName}&userLastName=${newLastName}&eMail=${newEmail}&password=${newPassword}");
   ///api/User/ProfileUpdate?id=9&userFirstName=weqwe&userLastName=qweq&eMail=qwe&password=q12eqwe
    final response = await http.put(uri);

    print("API Response Code: ${response.statusCode}");
    print("API Response Body: ${response.body}");

    if (response.statusCode == 200) {
      print("güncelleme başarılı");
      profilDoldur(); // Profil güncellendikten sonra tekrar verileri çek
    } else {
      throw Exception("failed to register");
    }
  }

  @override
  void initState() {
    profilDoldur();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(userId: widget.userId),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu_rounded, color: Colors.red),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.red,
              Color(0xFFfe17763),
              Color(0xFFe17763),
              Color(0xffb3ead8),
            ],
            stops: [0.1, 0.4, 0.6, 0.8, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MyTextField(controller: TextEditingController(text: firstName), hintText: "İsim", obscureText: false, onChanged: (value) => firstName = value),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MyTextField(controller: TextEditingController(text: lastName), hintText: "Soyisim", obscureText: false, onChanged: (value) => lastName = value),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MyTextField(controller: TextEditingController(text: email), hintText: "Mail Adresi", obscureText: false, onChanged: (value) => email = value),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MyTextField(controller: TextEditingController(text: password), hintText: "Şifre", obscureText: false, onChanged: (value) => password = value),
            ),
            SizedBox(height: 20),
            MyButton(
              onTap: () {
                updateProfile(firstName, lastName, email, password);
              },
              text: "Profili Güncelle",
              color: Color(0xfff1c40f),
            ),
          ],
        ),
      ),
    );
  }
}
