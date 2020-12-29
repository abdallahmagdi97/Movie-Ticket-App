import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/calendar_day.dart';
import 'package:movie_ticket_app/components/cienma_seat.dart';
import 'package:movie_ticket_app/components/show_time.dart';
import '../components/cienma_seat.dart';
import '../const.dart';

// ignore: must_be_immutable
class BuyTicket extends StatelessWidget {
  var title;
  var movieId;
  var userId;
  static const String id = 'buy_ticket';
  BuyTicket({@required this.title, @required this.movieId, @required this.userId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .12,
                    height: MediaQuery.of(context).size.width * .12,
                    decoration: kRoundedFadedBorder,
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CalendarDay(
                        dayNumber: '9',
                        dayAbbreviation: 'TH',
                      ),
                      CalendarDay(
                        dayNumber: '10',
                        dayAbbreviation: 'FR',
                      ),
                      CalendarDay(
                        dayNumber: '11',
                        dayAbbreviation: 'SA',
                      ),
                      CalendarDay(
                        dayNumber: '12',
                        dayAbbreviation: 'SU',
                        isActive: true,
                      ),
                      CalendarDay(
                        dayNumber: '13',
                        dayAbbreviation: 'MO',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: kPimaryColor,
                    size: 25.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('City Stars Cinema', style: kMainTextStyle),
                      Text('City Stars Mall, Nasr City, Cairo',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 18.0)),
                      SizedBox(height: 10.0),
                      /*Row(
                        children: <Widget>[
                          Text('2D', style: kMainTextStyle),
                          SizedBox(width: 10.0),
                          Text('3D',
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )*/
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.white38,
                  )
                ],
              ),
            ),
            Center(child: Image.asset('assets/images/screen.png')),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(seatCode: 1, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 2, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 3, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 4, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 5, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(seatCode: 6, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 7, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 8, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 9, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 10, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 11, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 12, movie: movieId, user: userId),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(seatCode: 13, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 14, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 15, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 16, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 17, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 18, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 19, movie: movieId, user: userId),
                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(seatCode: 20, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 21, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 22, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 23, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 24, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 25, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 26, movie: movieId, user: userId),
                    ],
                  ),
                  // 5TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(seatCode: 27, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 28, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 29, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 30, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 31, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 32, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 33, movie: movieId, user: userId),
                    ],
                  ),
                  // 6TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(seatCode: 34, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 35, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 36, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 37, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 38, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 39, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 40, movie: movieId, user: userId),
                    ],
                  ),
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(seatCode: 41, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 42, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 43, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 44, movie: movieId, user: userId),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(seatCode: 45, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 46, movie: movieId, user: userId),
                      CienmaSeat(seatCode: 47, movie: movieId, user: userId)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '30\$',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: kActionColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25.0))),
                    child: InkWell(
                        child: Text('Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
