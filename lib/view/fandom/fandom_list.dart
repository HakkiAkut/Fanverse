import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/util/components/list_tiles/fandoms_list_tile.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FandomList extends StatefulWidget {
  final String title;

  FandomList({Key key, this.title}) : super(key: key);

  @override
  _FandomListState createState() => _FandomListState();
}

class _FandomListState extends State<FandomList> {
  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    final _fandomVM = Provider.of<List<Fandom>>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.getMainColor(_appUserVM.isDarkTheme),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Palette.getTextColor(_appUserVM.isDarkTheme),
          ),
        ),
      ),
      floatingActionButton: widget.title == "All Fandoms"
          ? FloatingActionButton(
              onPressed: () {
                print("deneme");
                Navigator.pushNamed(context, NavigationConstants.CREATE_FANDOM);
                //FandomVM().createFandom(
                //  fandom: Fandom(name: "name", description: "description"));
              },
              child: Icon(Icons.add),
            )
          : Container(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _fandomVM.isEmpty
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      primary: false,
                      itemBuilder: (context, index) {
                        print("${_fandomVM[index].fid}");
                        return fandomListTile(
                            context: context,
                            fandom: _fandomVM[index],
                            isDarkMode: _appUserVM.isDarkTheme);
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 18.0,
                        );
                      },
                      itemCount: _fandomVM.length),
            ],
          ),
        ),
      ),
    );
  }
}
