import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.getMainColor(_appUserVM.isDarkTheme),
        title: Text(
          "My Profile",
          style: TextStyle(
            color: Palette.getTextColor(_appUserVM.isDarkTheme),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: DynamicSize.dynamicWidth(context, 0.05),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: DynamicSize.dynamicWidth(context, 0.4),
                  height: DynamicSize.dynamicWidth(context, 0.4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: Palette.PROFILE_GRADIENT,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/user-icons/${_appUserVM.appUser.image}"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ),
              Text(
                _appUserVM.appUser.username,
                style: profileText,
              ),
              Text(
                "joined: " +
                    DateFormat.yMMMd().format(
                      _appUserVM.appUser.registrationDate.toDate(),
                    ),
              ),
              SizedBox(
                height: DynamicSize.dynamicWidth(context, 0.05),
              ),
              Container(
                height: DynamicSize.dynamicHeight(context, 0.60),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors:
                            Palette.getGradientColor(_appUserVM.isDarkTheme)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Container(
                  padding: EdgeInsets.only(
                    top: DynamicSize.dynamicWidth(context, 0.05),
                  ),
                  width: DynamicSize.dynamicWidth(context, 1),
                  child: Column(
                    children: [
                      Container(
                        width: DynamicSize.dynamicWidth(context, 0.9),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Palette.getProfileBackground(
                                      _appUserVM.isDarkTheme))),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, NavigationConstants.RECENT_ACTIVITIES);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.archive_rounded),
                              Text(
                                "Recent Activities",
                                style: labelText,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: DynamicSize.dynamicWidth(context, 0.9),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Palette.getProfileBackground(
                                      _appUserVM.isDarkTheme))),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, NavigationConstants.MY_FANDOMS);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.bookmark),
                              Text(
                                "Fandom Membership",
                                style: labelText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
