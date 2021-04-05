import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:fandom_app/view/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  initializeLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fandom App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
    );
  }
}
