import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser{
  String uid;
  String username;
  String email;
  DateTime registrationDate;


  AppUser({this.uid, this.username, this.email,this.registrationDate});

  Map<String, dynamic> toMap(){
    return{
      "userId": uid,
      "username": username,
      "email": email,
      "registration_date": registrationDate ?? FieldValue.serverTimestamp(),
    };
  }
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      registrationDate: (map['registrationDate'] as Timestamp).toDate(),
    );
  }
}