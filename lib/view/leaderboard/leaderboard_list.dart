import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderBoardList extends StatefulWidget {
  @override
  _LeaderBoardListState createState() => _LeaderBoardListState();
}

class _LeaderBoardListState extends State<LeaderBoardList> {
  @override
  Widget build(BuildContext context) {
    final _fandomVM = Provider.of<List<Fandom>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _fandomVM.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Palette.getRandomColor(),
                child: ListTile(
                  title: Text(_fandomVM[index].name),
                  trailing: Text("${_fandomVM[index].getNumberOfMembers()}"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, NavigationConstants.FANDOM_MORE,
                        arguments: _fandomVM[index]);
                  },
                ),
              );
            }),
      ),
    );
  }
}
