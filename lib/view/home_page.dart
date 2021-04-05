import 'package:fandom_app/models/app_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final AppUser appUser;
  HomePage({Key key, this.appUser}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
    );
  }
}
