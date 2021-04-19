import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:flutter/material.dart';

class TabLayout {
  static Drawer buildDrawer({@required BuildContext context}) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Palette.GRADIENT_COLOR,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/logo_white.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _customListTile(
            context: context,
            icon1: Icons.assignment,
            text: "Home Page",
            icon2: Icons.arrow_right,
            navigation: NavigationConstants.HOME_PAGE,
          ),
          _customListTile(
            context: context,
            icon1: Icons.account_box,
            text: "Profile",
            icon2: Icons.arrow_right,
            navigation: NavigationConstants.PROFILE,
          ),
        ],
      ),
    );
  }

  /// menüdeki itemleri oluşturan metod
  static Container _customListTile(
      {@required BuildContext context,
        @required IconData icon1,
        @required String text,
        @required IconData icon2,
        @required String navigation}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.red.shade100),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon1,
          color: Palette.BOLD_COLOR,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Palette.BOLD_COLOR,
          ),
        ),
        trailing: Icon(
          icon2,
          color: Palette.BOLD_COLOR,
        ),
        onTap: () {
          switch (navigation) {
            case NavigationConstants.HOME_PAGE:
              Navigator.pushNamed(context, NavigationConstants.ROOT);
              break;
            case NavigationConstants.PROFILE:
              Navigator.pushNamed(context, NavigationConstants.PROFILE);
              break;
          }
        },
      ),
    );
  }
}
