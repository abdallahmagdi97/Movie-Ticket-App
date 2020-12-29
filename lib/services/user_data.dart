import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_ticket_app/models/movie.dart';
import 'package:movie_ticket_app/models/user.dart';

class UserDataService {
  final CollectionReference userCollection =
      Firestore.instance.collection('user');
  final CollectionReference movieCollection =
      Firestore.instance.collection('movie');
  final CollectionReference seatCollection =
      Firestore.instance.collection('seat');
  final CollectionReference requestCollection =
      Firestore.instance.collection('caseRequest');

  Future<void> updateUserData(String email, String firstName, String lastName,
      String phoneNumber) async {
    return await userCollection.document().setData({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    });
  }

  Future<DocumentReference> reserveSeat(int seatCode,String movieId, String userId) async {
    return await seatCollection.add({
      'seatCode': seatCode,
      'movie': movieId,
      'user': userId,
      'isReserved': true,
    });
  }

  List<Seat> getSeats() {
    List<Seat> seats = [];
    seatCollection.snapshots().listen((data) {
      data.documents.forEach((doc) {
        Seat seat = Seat(
            seatCode: doc['seatCode'],
            movie: doc['movie'],
            user: doc['user'],
            isReserved: doc['isReserved']);
        print("movie:" + seat.toString());
        seats.add(seat);
      });
    });
    print("length = " + seats.length.toString());
    return seats;
  }

 getMovies(List<Movie> movies) {
    movieCollection.snapshots().listen((data) {
      data.documents.forEach((doc) {
        Movie movie = Movie(
            title: doc['title'],
            age: doc['age'],
            imageURL: doc['imageURL'],
            category: doc['category'],
            logo: doc['logo'],
            rating: doc['rating'],
            technology: doc['technology'],
            date: doc['date']);
        print("movie:" + movie.toString());
        movies.add(movie);
      });
    });
  }

  Future<User> getUserData() async {
    User userData;
    final CollectionReference userCollection =
        Firestore.instance.collection('user');
    await userCollection.document().get().then((element) {
      userData = User(
        email: element.data['email'],
        firstName: element.data['firstName'],
        lastName: element.data['lastName'],
        phoneNumber: element.data['phoneNumber'],
      );
    });
    return userData;
  }
}

class Seat {
  int seatCode;
  Movie movie;
  User user;
  bool isReserved;
  Seat({this.seatCode, this.movie, this.user, this.isReserved});
}
