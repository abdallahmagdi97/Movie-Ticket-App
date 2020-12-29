import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/screens/buy_ticket.dart';
import 'package:movie_ticket_app/screens/home.dart';
import 'package:movie_ticket_app/screens/login_screen.dart';
import 'package:movie_ticket_app/screens/registration_screen.dart';
import 'package:movie_ticket_app/screens/splashScreen.dart';
import 'package:movie_ticket_app/screens/welcome_screen.dart';
import 'package:movie_ticket_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/buy_ticket.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: UserAuthService().user,
      child: MaterialApp(
        title: 'Movie Ticket app ',
      debugShowCheckedModeBanner: false,
      theme: theme,
        navigatorKey: navigatorKey,
        home: SplashScreenPage(),
        routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        // ignore: missing_required_param
        BuyTicket.id : (context) => BuyTicket(),
        MyHomePage.id : (context) => MyHomePage(),
      },
      ),
    );
  }
}
