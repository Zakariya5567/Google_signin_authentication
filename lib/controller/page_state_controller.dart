import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_login/screens/home_screen.dart';
import 'package:google_login/screens/login_screen.dart';

class PageStateController extends StatefulWidget {
  const PageStateController({Key? key}) : super(key: key);

  @override
  _PageStateController createState() => _PageStateController();
}

class _PageStateController extends State<PageStateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Colors.red,));
            } else if (snapshot.hasData) {
                  return HomeScreen();
            }
            else if (snapshot.hasError) {
              return Center(child: Text("something went Wrong"),);
            }
            else {
              return LoginScreen();
            }
          }
          ), //loginUI(),
    );
  }
}