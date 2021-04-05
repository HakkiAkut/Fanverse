import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Firebase Authentication class
class Auth implements AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Firebase current user
  @override
  Future<AppUser> currentUser() async {
    User user = _auth.currentUser;
    return convertUserToAppUser(user);
  }

  /// Firebase authentication with email and password
  @override
  Future<AppUser> signInWithEmail({String email, String pwd}) async {
    UserCredential credential =
        await _auth.signInWithEmailAndPassword(email: email, password: pwd);
    return convertUserToAppUser(credential.user);
  }

  /// Firebase sign out
  @override
  Future<bool> signOut() async {
    await _auth.signOut().onError((error, stackTrace) => false);
    return true;
  }

  /// converts Firebase user to Application User
  AppUser convertUserToAppUser(User user) {
    return user != null
        ? AppUser(uid: user.uid, email: user.email, username: "")
        : null;
  }
}
