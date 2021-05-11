import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/util/components/list_tiles/fandoms_list_tile.dart';
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
    final _fandomVM = Provider.of<List<Fandom>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                            context: context, fandom: _fandomVM[index]);
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
