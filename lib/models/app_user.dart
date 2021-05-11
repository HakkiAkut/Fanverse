import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/util/methods/random_generator.dart';

class AppUser{
  String uid;
  String username;
  String email;
  String image;
  Timestamp registrationDate;


  AppUser({this.uid, this.username, this.email, this.image, this.registrationDate});

  Map<String, dynamic> toMap(){
    return{
      "userId": uid,
      "username": username,
      "email": email,
      "image": image ?? "${RandomGenerator().getRandomInt(11)}.png",
      "registration_date": registrationDate ?? FieldValue.serverTimestamp(),
    };
  }
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      registrationDate: map['registration_date'] as Timestamp,
    );
  }
}