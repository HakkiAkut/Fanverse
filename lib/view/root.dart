import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/view/home_page.dart';
import 'package:fandom_app/view/sign_in.dart';
import 'package:fandom_app/view/sign_up.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  bool goToSignIn;

  RootPage({this.goToSignIn});

  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    if (_appUserVM.state == AppState.IDLE) {
      return _appUserVM.appUser != null
          ? StreamProvider<List<News>>.value(
              value: NewsVM().getNews(),
              child: HomePage(appUser: _appUserVM.appUser),
              initialData: [],
              updateShouldNotify: (prev,now)=>true,
            )
          : goToSignIn
              ? SignInPage()
              : SignUpPage();
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
