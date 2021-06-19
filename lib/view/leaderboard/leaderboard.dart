import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/view/leaderboard/leaderboard_list.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Fandom>>.value(
      value: FandomVM().getFandom(),
      initialData: [],
      child: LeaderBoardList(),
      updateShouldNotify: (prev, now) => true,
    );
  }
}
