import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/services/firebase/firestore_db.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/components/toast_message.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/news_view_model.dart';
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
  FirestoreDB firestore = FirestoreDB();

  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    final _newsVM = Provider.of<List<News>>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _newsVM == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      print("${_newsVM[index].title}");
                      return Text("${_newsVM[index].title}");
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.indigo,
                        height: 1,
                        indent: 10,
                        endIndent: 10,
                      );
                    },
                    itemCount: _newsVM.length),
            ElevatedButton(
              style: buttonStyle,
              child: Text(
                "Log out",
                style: labelText,
              ),
              onPressed: () async {
                bool signOut = await _appUserVM.signOut();
                if (!signOut) {
                  errorMessage(
                      message:
                          "Your log out could not be made!\nPlease try again!",
                      durationShort: true);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
