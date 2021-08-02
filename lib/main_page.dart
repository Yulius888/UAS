import 'package:aut/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final User user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MainPage"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(user.uid),
              RaisedButton(
                  child: Text("Sign Out"),
                  onPressed: () async {
                    await AuthServices.signOut();
                  })
            ],
          ),
        ));
  }
}
