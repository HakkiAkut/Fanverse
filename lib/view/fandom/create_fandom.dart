import 'dart:io';
import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/methods/pick_image.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFandom extends StatefulWidget {
  @override
  _CreateFandomState createState() => _CreateFandomState();
}

class _CreateFandomState extends State<CreateFandom> {
  var _key = GlobalKey<FormState>();
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  List<TextEditingController> tecList = [TextEditingController()];
  List<String> pageClasses = [];
  int classNum = 1;
  File fandomImage;

  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Fandom"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: tec1,
                  decoration: InputDecoration(hintText: 'Fandom Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Fandom Name cannot be null!";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: tec2,
                  decoration: InputDecoration(hintText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Description Name cannot be null!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'pick image',
                      style: labelText.copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () async {
                        fandomImage = await PickImage().chooseFile();
                      },
                      child: Icon(Icons.perm_media_outlined),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Add Page Classes:  $classNum',
                      style: labelText.copyWith(color: Colors.black),
                    ),
                    FloatingActionButton(
                        heroTag: "heroTag",
                        child: Icon(Icons.add),
                        mini: true,
                        onPressed: () {
                          setState(() {
                            classNum++;
                            tecList.add(TextEditingController());
                          });
                        })
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: classNum,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Class Name $index'),
                              controller: tecList[index],
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Class Name cannot be null!";
                                }
                                return null;
                              },
                            ),
                          ),
                          FloatingActionButton(
                              child: Icon(Icons.cancel_outlined),
                              heroTag: "hero$index",
                              backgroundColor: Colors.red,
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  if (classNum != 0) {
                                    classNum--;
                                    tecList.removeAt(index);
                                  }
                                });
                              }),
                        ],
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    if (_key.currentState.validate() && fandomImage != null) {
                      _key.currentState.save();
                      Map<String, dynamic> str = {};
                      Map<String, dynamic> admin = {
                        _appUserVM.appUser.uid: true
                      };
                      Map<String, dynamic> members = {
                        _appUserVM.appUser.uid: true
                      };
                      for (int i = 0; i < tecList.length; i++) {
                        str[tecList[i].value.text] = "${tec1.value.text}_${tecList[i].value.text}";
                      }
                      Fandom fandom = Fandom(
                          name: tec1.value.text,
                          description: tec2.value.text,
                          pageClasses: str,
                          admins: admin,
                          members: members);
                      FandomVM()
                          .createFandom(fandom: fandom, file: fandomImage);
                    }
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
