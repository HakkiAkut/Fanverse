import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/util/components/input_decoration.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/components/toast_message.dart';
import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/view/root.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _pwd = "";
  String _email = "";

  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: dynamicHeight(context, 0.25),
              child: Image.asset("assets/logo.png"),
            ),
            Container(
              height: dynamicHeight(context, 0.75),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColor),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: _buildLoginLayer(),
            )
          ],
        ),
      ),
    );
  }

  /// layer that have login process components
  Container _buildLoginLayer() {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      height: double.infinity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            _buildEmailBox(),
            SizedBox(
              height: 8.0,
            ),
            _buildPasswordBox(),
            _buildLoginButton(context: context),
            Text(
              "or login with",
              style: labelText,
            ),
            SizedBox(
              height: 8.0,
            ),
            _buildGoogleLoginButton(context: context),
            SizedBox(
              height: 8.0,
            ),
            _buildSignUpNowButton()
          ],
        ),
      ),
    );
  }

  GestureDetector _buildSignUpNowButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => RootPage(
              goToSignIn: false,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have account? ",
              style: labelText.copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              "Sign Up Now!",
              style: labelText,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildGoogleLoginButton({@required BuildContext context}) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return GestureDetector(
      onTap: () async {
        //errorMessage(message: "Currently on progress!\nPlease login with email!",durationShort: true);
        AppUser appUser;
        try {
          appUser = await _appUserVM.signInWithGoogle();
        } catch (e) {
          errorMessage(
              message: "Sign in could not be made\n ${e.toString()}",
              durationShort: false);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: dynamicWidth(context, 0.13),
        height: dynamicWidth(context, 0.13),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/google_logo.jpg"), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }

  /// login button
  Container _buildLoginButton({@required BuildContext context}) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () async {
          if (key1.currentState.validate() && key2.currentState.validate()) {
            key1.currentState.save();
            key2.currentState.save();
            AppUser appUser;
            try {
              appUser =
                  await _appUserVM.signInWithEmail(email: _email, pwd: _pwd);
            } catch (e) {
              errorMessage(
                  message: "Sign in could not be made\n ${e.toString()}",
                  durationShort: false);
            }
          } else {
            print("hata var");
          }
        },
        child: Text(
          "Log In",
          style: labelText.copyWith(
            letterSpacing: 1.5,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  /// password box
  Column _buildPasswordBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "password:",
          style: labelText,
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: TextFormField(
            //keyboardType: TextInputType.pas,
            obscureText: true,
            key: key2,
            onChanged: (String s) => _pwd = s,
            onSaved: (String s) => _pwd = s,
            style: TextStyle(
              color: Colors.white,
            ),
            validator: (_value) {
              if (_value.length < 1) {
                return "password can not be null!";
              } else {
                return null;
              }
            },
            decoration: inputStyle.copyWith(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: '******',
              hintStyle: hintText,
            ),
          ),
        ),
      ],
    );
  }

  /// Email box
  Column _buildEmailBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "email:",
          style: labelText,
        ),
        SizedBox(
          height: 5.0,
        ),
        TextFormField(
          key: key1,
          keyboardType: TextInputType.name,
          onChanged: (String s) => _email = s,
          onSaved: (String s) => _email = s,
          style: TextStyle(
            color: Colors.white,
          ),
          validator: (_value) {
            bool validation = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(_value);
            if (!validation) {
              return "invalid email!";
            } else {
              return null;
            }
          },
          decoration: inputStyle.copyWith(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            hintText: 'email',
            hintStyle: hintText,
          ),
        ),
      ],
    );
  }
}
