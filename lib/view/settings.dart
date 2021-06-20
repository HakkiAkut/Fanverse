import 'package:app_settings/app_settings.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Icon(
            Icons.keyboard_backspace,
            color: Palette.getTextColor(_appUserVM.isDarkTheme),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, NavigationConstants.ROOT,
                arguments: true);
          },
        ),
        backgroundColor: Palette.getMainColor(_appUserVM.isDarkTheme),
        title: Text(
          "Settings",
          style: TextStyle(color: Palette.getTextColor(_appUserVM.isDarkTheme)),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              color: Palette.getMainColor(_appUserVM.isDarkTheme),
              child: ListTile(
                title: Text(
                  "Enable/Disable Dark Theme",
                  style: TextStyle(
                      color: Palette.getTextColor(_appUserVM.isDarkTheme)),
                ),
                trailing: CupertinoSwitch(
                  value: _appUserVM.isDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      _appUserVM.darkTheme(value);
                    });
                  },
                ),
              ),
            ),
            Card(
              color: Palette.getMainColor(_appUserVM.isDarkTheme),
              child: ListTile(
                title: Text(
                  "Enable/Disable Notifications",
                  style: TextStyle(
                      color: Palette.getTextColor(_appUserVM.isDarkTheme)),
                ),
                trailing: TextButton(
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    color: Palette.getTextColor(_appUserVM.isDarkTheme),
                  ),
                  onPressed: () {
                    AppSettings.openAppSettings();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
