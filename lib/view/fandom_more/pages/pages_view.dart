import 'package:fandom_app/models/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagesView extends StatefulWidget {
  final String title;

  const PagesView({Key key, this.title}) : super(key: key);

  @override
  _PagesViewState createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
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
                Container(
                  child: Column(
                    children: [
                      Image.network(
                        _pagesVM[0].imageUrl,
                        fit: BoxFit.fill,
                        height: 170,
                      ),
                      Text(_pagesVM[0].name)
                    ],
                  ),
                )
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
