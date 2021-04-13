import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/news_list_tile.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/components/toast_message.dart';
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
    final _newsVM = Provider.of<List<News>>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [              ElevatedButton(
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _newsVM.isEmpty
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      primary: false,
                      itemBuilder: (context, index) {
                        print("${_newsVM[index].title}");
                        return newsListTile(
                            context: context, news: _newsVM[index]);
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return         SizedBox(
                          height: 18.0,
                        );
                      },
                      itemCount: _newsVM.length),
            ],
          ),
        ),
      ),
    );
  }
}
