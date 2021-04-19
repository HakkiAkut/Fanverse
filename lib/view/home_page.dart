import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/components/news_list_tile.dart';
import 'package:fandom_app/view/tab_layout.dart';
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
    final _newsVM = Provider.of<List<News>>(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: TabLayout.buildDrawer(context: context),
      appBar: AppBar(
        title: Text("Home Page"),
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
                        return SizedBox(
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
