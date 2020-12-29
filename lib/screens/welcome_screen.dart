
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      duration: Duration(seconds: 1),vsync: this,);
      animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
      controller.forward();
      // animation.addStatusListener((status) {
       // if (status == AnimationStatus.completed) {
        //  controller.reverse(from: 1.0);
       // } else if (status == AnimationStatus.dismissed) {
         // controller.forward();
       // }
      //});
      controller.addListener(() {
          setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  child: Container(
                    child: null, //Image.asset('images/logo.jpg'),
                    height: animation.value * 100,
                  ), tag: 'logo',
                ),
                Text(
                  'Movie App',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Login',
              onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
          ],
        ),
      ),
    );
  }
}

