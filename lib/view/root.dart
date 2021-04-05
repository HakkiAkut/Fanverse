import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/view/home_page.dart';
import 'package:fandom_app/view/sign_in.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AppUser user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return user != null
        ? HomePage(appUser: user)
        : SignInPage();
  }
}
