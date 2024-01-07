
import 'dart:convert';

import 'package:denemeuygulama/screens/login_screen.dart';
import 'package:denemeuygulama/services/user_api.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // text editting controllers
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final passwordController=TextEditingController();
  final emailController=TextEditingController();

  void register(String email, password, firstName, lastName) async {
   //var response = UserApi().UserRegister(email,password, firstName, lastName);
      final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/User/Register?userFirstName=${firstName}&userLastName=${lastName}&eMail=${email}&password=${password}");
      // final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/User/Register?userFirstName=flipcard&userLastName=uygulama&eMail=a@gmail.com&password=123");
      final response=await http.post(uri);
      if(response.statusCode==200) {
        print("kayıt başarılı");
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginView()));
      }
      else throw Exception("failed to register");
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(

            children: [
              const SizedBox(height: 75),

              const Icon(
                Icons.supervised_user_circle_rounded,
                size: 100,
              ),

              const SizedBox(height: 30),

              Center(
                child: Text("Welcome lets join us!",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16
                    )),
              ),

              const SizedBox(height: 25),

            MyTextField(
                controller: firstNameController,
                hintText: "First Name",
                obscureText: false,
              ),

              const SizedBox(height: 10),
              MyTextField(
                controller: lastNameController,
                hintText: "Last Name",
                obscureText: false,
              ),

              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                hintText: "E-mail",
                obscureText: false,
              ),

              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(height: 25),

              MyButton(
                onTap:(){
                  register(emailController.text.toString(), passwordController.text.toString(),firstNameController.text.toString(),lastNameController.text.toString());
                } ,
                text: "Register",
                color: Colors.green,
              ),



              const SizedBox(height: 40),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have a account?", style: TextStyle(color: Colors.grey[700]),),
                  const SizedBox(width: 5),
                  new GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginView()));
                    },
                 child: Text("Login now",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}



