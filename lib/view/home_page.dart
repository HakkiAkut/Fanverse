import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final AppUser appUser;

  HomePage({Key key, this.appUser}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return _appUserVM.state == AppState.BUSY
        ? Scaffold(
            key: _scaffoldKey,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text("Home Page"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Currently on progress...", style: TextStyle(fontSize: 25),),
                  ElevatedButton(
                    style: buttonStyle,
                    child: Text(
                      "Log out",
                      style: labelText,
                    ),
                    onPressed: () async {
                      bool signOut = await _appUserVM.signOut();
                    },
                  )
                ],
              ),
            ),
          );
  }
}
