
import 'package:flutter/material.dart';
import 'package:google_login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("LogIn", style: TextStyle(fontSize: 50, fontFamily: 'serif'),),
          toolbarHeight: 300,
          backgroundColor: Colors.teal.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(150.0),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(color: Colors.teal.shade900,),
            MaterialButton(
                height: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.height,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
                color: Colors.white,
                onPressed: () {}),
            Center(
              child: MaterialButton(
                  height: 50, minWidth: 200,
                  child: Text("SignIn with Google",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.teal.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {
                    Provider.of<GoogleSigInProvider>(context, listen: false).googleLogin();
                  }
                  ),
            )
          ],
        ));
  }
}
