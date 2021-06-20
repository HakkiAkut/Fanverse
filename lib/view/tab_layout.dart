import 'package:fandom_app/util/components/toast_message.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabLayout {
  static Drawer buildDrawer({@required BuildContext context}) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Palette.getGradientColor(_appUserVM.isDarkTheme),
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
          _customListTile(
            context: context,
            icon1: Icons.list_alt_sharp,
            text: "Fandoms",
            icon2: Icons.arrow_right,
            navigation: NavigationConstants.FANDOMS,
          ),
          _customListTile(
            context: context,
            icon1: Icons.my_library_books_sharp,
            text: "My Fandoms",
            icon2: Icons.arrow_right,
            navigation: NavigationConstants.MY_FANDOMS,
          ),
          _customListTile(
            context: context,
            icon1: Icons.leaderboard,
            text: "Leaderboard",
            icon2: Icons.arrow_right,
            navigation: NavigationConstants.LEADERBOARD,
          ),
          _customListTile(
            context: context,
            icon1: Icons.settings,
            text: "Settings",
            icon2: Icons.arrow_right,
            navigation: NavigationConstants.SETTINGS,
          ),
          _customListTile(
            context: context,
            icon1: Icons.backspace,
            text: "Sign Out",
            icon2: null,
            navigation: NavigationConstants.SIGN_OUT,
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
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Container(
      decoration: BoxDecoration(
        color: Palette.getBackground(_appUserVM.isDarkTheme),
        border: Border(
          bottom: BorderSide(color: Colors.red.shade100),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon1,
          color: Palette.getTabLayoutColor(_appUserVM.isDarkTheme),
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Palette.getTabLayoutColor(_appUserVM.isDarkTheme),
          ),
        ),
        trailing: Icon(
          icon2,
          color: Palette.getTabLayoutColor(_appUserVM.isDarkTheme),
        ),
        onTap: () async {
          switch (navigation) {
            case NavigationConstants.HOME_PAGE:
              Navigator.pushReplacementNamed(context, NavigationConstants.ROOT,
                  arguments: true);
              break;
            case NavigationConstants.PROFILE:
              Navigator.pushNamed(context, NavigationConstants.PROFILE);
              break;
            case NavigationConstants.FANDOMS:
              Navigator.pushNamed(context, NavigationConstants.FANDOMS);
              break;
            case NavigationConstants.MY_FANDOMS:
              Navigator.pushNamed(context, NavigationConstants.MY_FANDOMS);
              break;
            case NavigationConstants.LEADERBOARD:
              Navigator.pushNamed(context, NavigationConstants.LEADERBOARD);
              break;
            case NavigationConstants.SETTINGS:
              Navigator.pushNamed(context, NavigationConstants.SETTINGS);
              break;
            case NavigationConstants.SIGN_OUT:
              bool signOut = await _appUserVM.signOut();
              if (!signOut) {
                errorMessage(
                    message:
                        "Your log out could not be made!\nPlease try again!",
                    durationShort: true);
              }
              break;
          }
        },
      ),
    );
  }
}
