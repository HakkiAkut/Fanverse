import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:fandom_app/view/root.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/news_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  initializeLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppUserVM>(create: (context) => AppUserVM()),
      ],
      child: MaterialApp(
        title: 'Fandom App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RootPage(
          goToSignIn: true,
        ),
      ),
    );
  }
}
