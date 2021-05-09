import 'package:fandom_app/util/components/fandoms_list_tile.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FandomsPage extends StatefulWidget {
  @override
  _FandomsPageState createState() => _FandomsPageState();
}

class _FandomsPageState extends State<FandomsPage> {
  @override
  Widget build(BuildContext context) {
    final _fandomVM = Provider.of<FandomVM>(context);
    if (_fandomVM.state == AppState.IDLE) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Fandoms"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _fandomVM.allFandoms.isEmpty
                    ? CircularProgressIndicator()
                    : ListView.separated(
                    primary: false,
                    itemBuilder: (context, index) {
                      print("${_fandomVM.allFandoms[index].fid}");
                      return fandomListTile(
                          context: context, fandom: _fandomVM.allFandoms[index]);
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 18.0,
                      );
                    },
                    itemCount: _fandomVM.allFandoms.length),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Fandoms"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
