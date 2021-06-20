import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagesList extends StatefulWidget {
  final String title;
  final String classId;

  const PagesList({Key key, this.title, this.classId}) : super(key: key);

  @override
  _PagesListState createState() => _PagesListState();
}

class _PagesListState extends State<PagesList> {
  @override
  Widget build(BuildContext context) {
    final _pagesVM = Provider.of<List<Pages>>(context);
    final _appUserVM = Provider.of<AppUserVM>(context);
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Nav
          Navigator.pushNamed(context, NavigationConstants.CREATE_PAGE,
              arguments: widget.classId);
        },
      ),
      body: _pagesVM.isNotEmpty
          ? GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _pagesVM.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.amber,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, NavigationConstants.PAGES_VIEW,
                              arguments: _pagesVM.first);
                        },
                        child: Container(
                          height: 140,
                          child: Image.network(
                            _pagesVM[index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(_pagesVM[index].name)
                    ],
                  ),
                );
              })
          : CircularProgressIndicator(),
    );
  }
}
/**/
