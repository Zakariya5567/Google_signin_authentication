import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading=false;
  final user=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Home Screen",),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
              onPressed:(){
                Provider.of<GoogleSigInProvider>(context, listen: false).logout();
              }, ),
        ],

      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              radius: 50,
            ),
            Text(user.displayName!),
            Text(user.email!),

          ],
        ),
      ),

    );
  }
}
