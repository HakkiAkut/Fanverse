import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/view/home_page.dart';
import 'package:fandom_app/view/news_more.dart';
import 'package:fandom_app/view/root.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> initializeRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/RootPage':
        if (args is bool) {
          return MaterialPageRoute(
            builder: (_) => RootPage(
              goToSignIn: args,
            ),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => RootPage(),
          );
        }
        return _errorRoute();

      case '/HomePage':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case '/NewsMorePage':
        if (args is News) {
          return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => NewsMore(
              news: args,
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  // error page
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
