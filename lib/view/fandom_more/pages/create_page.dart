import 'dart:io';
import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/util/methods/pick_image.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/pages_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  final String classId;

  const CreatePage({Key key, this.classId}) : super(key: key);
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var _key = GlobalKey<FormState>();
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  File fandomImage;

  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.getMainColor(_appUserVM.isDarkTheme),
        title: Text("Create Page",style: TextStyle(
          color: Palette.getTextColor(_appUserVM.isDarkTheme),
        ),),
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
                  decoration: InputDecoration(hintText: 'Page Name'),
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
                TextButton(
                  onPressed: () {
                    if (_key.currentState.validate() && fandomImage != null) {
                      _key.currentState.save();
                      Pages page = Pages(
                        classId: widget.classId,
                        name: tec1.value.text,
                        text: tec2.value.text,
                      );
                      PagesVM()
                          .createPage(page: page, file: fandomImage);
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
