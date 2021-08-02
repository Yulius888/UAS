import 'package:aut/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth_services.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LoginPage"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                height: 100,
                child: TextField(
                  controller: emailController,
                ),
              ),
              Container(
                width: 250,
                height: 100,
                child: TextField(
                  controller: passwordController,
                ),
              ),
              RaisedButton(
                  child: Text("Sign In Anonym"),
                  onPressed: () async {
                    await AuthServices.signInAnonymous();
                  }),
              RaisedButton(
                  child: Text("Sign In"),
                  onPressed: () async {
                    await AuthServices.signIn(
                        emailController.text, passwordController.text);
                  }),
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {
                    await AuthServices.signUp(
                        emailController.text, passwordController.text);
                  }),
            ],
          ),
        ));
  }
}
