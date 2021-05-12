import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagesList extends StatefulWidget {
  final String title;

  const PagesList({Key key, this.title}) : super(key: key);

  @override
  _PagesListState createState() => _PagesListState();
}

class _PagesListState extends State<PagesList> {
  @override
  Widget build(BuildContext context) {
    final _pagesVM = Provider.of<List<Pages>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pagesVM.isNotEmpty
          ? GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, NavigationConstants.PAGES_VIEW, arguments: _pagesVM.first);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            _pagesVM[0].imageUrl,
                            fit: BoxFit.fill,
                            height: 155,
                          ),
                          Text(_pagesVM[0].name)
                        ],
                      ),
                    ))
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
