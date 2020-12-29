import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/home.dart';
import 'package:movie_ticket_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class SplashScreenPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreenPage>{
  User user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    new Future.delayed(const Duration(milliseconds: 2000), checkAuth);
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.brown[50],
      child: Container(
        child: null, //Image.asset('assets/images/Logo.jpg'),
        width: MediaQuery.of(context).size.width * 3 / 4,
        height: MediaQuery.of(context).size.width * 3 / 4,
      ),
    );
  }

  void checkAuth(){
    print("user in chechAuth = " + user.toString());
    if (user == null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }
}