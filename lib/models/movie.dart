import 'dart:convert';
import 'package:flutter/material.dart';

class Movie {
  String uid;
  String title;
  String age;
  String category;
  String imageURL;
  String logo;
  String rating;
  String technology;
  String date;

  Movie(
      {this.uid,
      @required this.title,
      @required this.imageURL,
      @required this.logo,
      @required this.age,
      @required this.rating,
      @required this.date,
      @required this.category,
      @required this.technology});

  Map toJson() => {
        'uid': uid,
        'title': title,
        'imageURL': imageURL,
        'logo': logo,
        'age': rating,
        'rating': rating,
        'date': date,
        'category': category,
        'technology': technology
      };

  String toString() => jsonEncode(this.toJson());
}

final List<Movie> moviesList = [
  Movie(
      uid: '9zuoXNoSI3By2z8sSxKb',
      title: 'The Irishman',
      imageURL:
          'https://lh6.googleusercontent.com/proxy/Q7IxHgbc0KPJJXyz3iG4YtLoZ2tujvlF4_NOHJWj54bnD133PH4LJQb_vyrUSQ45rL8XHe-doyHDp9SY9vA3pn43e-iQA236PQ',
      logo: 'assets/images/logos/irishman.png',
      age: 'R',
      rating: '8',
      date: '2019',
      category: 'Crime, Drama, Thriller',
      technology: 'DataSat, Dolby Digital'),
  Movie(
      uid: 'DDvMhzl6oNxxeRODkaYR',
      title: 'JOKER',
      imageURL:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/c58b4681277211.5cfa6e54a6d3d.jpg',
      logo: 'assets/images/logos/joker.png',
      age: '18+',
      rating: '8.7',
      date: '2019',
      category: 'Crime, Drama, Thriller',
      technology: 'DataSat, Dolby Digital '),
  Movie(
      uid: 'dXgL0gX1wZJgYuJfE3pi',
      title: 'Avengers: Endgame',
      imageURL:
          'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
      logo: 'assets/images/logos/avengers.png',
      age: 'PG-13',
      rating: '8.5',
      date: '2019',
      category: ' Action, Adventure, Drama',
      technology: 'DataSat, Dolby Digital '),
  Movie(
      uid: 'zKJ7W3NiiJTuiVsY3p0I',
      title: 'Once upon a time in Hollywood',
      imageURL:
          'https://posterposse.com/wp-content/uploads/2019/07/Once-upon-a-time-in-hollywood-Poster-Posse-Hughes.png',
      logo: 'assets/images/logos/hollywood.png',
      age: 'R',
      rating: '7.7',
      date: '2019',
      category: 'Drama, Comedy-drama',
      technology: 'DataSat, Dolby Digital '),
];
