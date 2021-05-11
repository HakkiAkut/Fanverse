import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/util/init/route_generator.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:fandom_app/view/root.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
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
        ChangeNotifierProvider(
          create: (context) => AppUserVM(),
        ),
        ChangeNotifierProvider(
          create: (context) => FandomVM(),
        ),
      ],
      child: MaterialApp(
        title: 'Fandom App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Palette.MAIN_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RootPage(
          goToSignIn: true,
        ),
        onGenerateRoute: RouteGenerator.initializeRoute,
        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
          builder: (context) => RootPage(),
        ), // if there is any problem with navigation returns to the Root
      ),
    );
  }
}
