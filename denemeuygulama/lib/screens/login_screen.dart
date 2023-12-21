
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // text editting controllers
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();

  void signUserIn(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 30),

              Text("Welcome back you\'ve been missed",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16
                  )),

              const SizedBox(height: 25),

              MyTextField(
                controller: usernameController,
                hintText: "Username",
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

              MyButton(
                onTap: signUserIn,
                text: "Login",
              ),

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
                  Text("Register now",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
