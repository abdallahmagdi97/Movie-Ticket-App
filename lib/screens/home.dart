// ignore: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/movie_card.dart';
import 'package:movie_ticket_app/models/movie.dart';
import 'package:movie_ticket_app/screens/welcome_screen.dart';
import 'package:movie_ticket_app/services/user_data.dart';

import '../components/background_gradient_image.dart';
import '../components/dark_borderless_button.dart';
import '../components/movie_app_bar.dart';
import '../components/primary_rounder_button.dart';
import '../components/red_rounded_action_button.dart';
import '../const.dart';
import 'buy_ticket.dart';

FirebaseUser loggedInUser;

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  static const String id = 'home';
  int index = 1;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  UserDataService userDataService;
  List<Movie> movies = new List<Movie>();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    userDataService = UserDataService();
    userDataService.getMovies(movies);
    checkMoviesList();
  }

  checkMoviesList() {
    if (movies.isEmpty || movies == null) {
      movies = moviesList;
    }
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      } else {
        Navigator.pushNamed(context, WelcomeScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String uid = movies[widget.index].uid;
    final String backgroundImage = movies[widget.index].imageURL;
    final String age = movies[widget.index].age;
    final String rating = movies[widget.index].rating;
    final String year = movies[widget.index].date;
    final String categories = movies[widget.index].category;
    final String technology = movies[widget.index].technology;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundGradientImage(
            image: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                MovieAppBar(),
                Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                Text(
                  'NEW.MOVIE',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(movies[widget.index].logo),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DarkBorderlessButton(
                      text: 'Popular with Friends',
                      callback: () {},
                    ),
                    DarkBorderlessButton(text: age, callback: () {}),
                    PrimaryRoundedButton(
                      text: rating,
                      callback: () {},
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        year,
                        style: kSmallMainTextStyle,
                      ),
                      Text('•', style: kPromaryColorTextStyle),
                      Text(categories, style: kSmallMainTextStyle),
                      Text('•', style: kPromaryColorTextStyle),
                      Text(technology, style: kSmallMainTextStyle),
                    ],
                  ),
                ),
                Image.asset('assets/images/divider.png'),
                RedRoundedActionButton(
                    text: 'BUY TICKET',
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BuyTicket(movieId: uid, title: movies[widget.index].title, userId: loggedInUser.uid,),
                        ),
                      );
                    }),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                              title: movies[index].title,
                              imageLink: movies[index].imageURL,
                              active: index == widget.index ? true : false,
                              callBack: () {
                                setState(() {
                                  widget.index = index;
                                });
                              });
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
