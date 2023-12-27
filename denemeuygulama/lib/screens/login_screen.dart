
import 'dart:convert';

import 'package:denemeuygulama/models/user.dart';
import 'package:denemeuygulama/screens/register_screen.dart';
import 'package:denemeuygulama/screens/words_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import '../services/category_api.dart';
import '../services/user_api.dart';
import 'home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  late int userId;
  void girisYap(String email, String password) async
  {
    final response = await http.post(
      Uri.parse('https://webapi20231207005716.azurewebsites.net/api/User/Login?email=${email}&password=${password}'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode==200 ||response.statusCode==201 ||response.statusCode==204)
      {
        print(response.body);
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse is Map<String, dynamic>) {
          // UserId, yanıtın içinde bir alan olarak mevcut olabilir
          var _userId = jsonResponse['userID'];
          setState(() {
            userId=_userId;
          });
          print('userID: $userId');
        } else {
          print('Dönen veri beklenen formatta değil.');
        }
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeView
        (userId: userId)));
      }
    print(response.statusCode);
    print("giriş başarılı");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75),

              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 30),

              Center(
                child: Text("Welcome back you\'ve been missed",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16
                    )),
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 25),

              ElevatedButton(onPressed: () async{
               String email= emailController.text;
                String password= passwordController.text;
                girisYap(email,password);

              }
                  , child: Text("Giriş")),


              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(children: [
                  Expanded(child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                  Text("Or continue with"),
                  Expanded(child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[700],
                  ))
                ],),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SquareTile(imagePath: "lib/assets/google.png"),
                  const SizedBox(width: 10),
                  SquareTile(imagePath: "lib/assets/apple.png"),

                ],
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?", style: TextStyle(color: Colors.grey[700]),),
                  const SizedBox(width: 5),
                  new GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegisterView()));
                    },
                    child: Text("Register now",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
