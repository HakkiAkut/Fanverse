import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/input_decoration.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/components/toast_message.dart';
import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/view/root.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _pwd = "";
  String _email = "";
  String _username = "";

  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  var key3 = GlobalKey<FormFieldState>();

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
              child: _buildSignUpLayer(),
            )
          ],
        ),
      ),
    );
  }

  Container _buildSignUpLayer() {
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
            SizedBox(
              height: 8.0,
            ),
            _buildUsernameBox(),
            _buildSignUpButton(context),
            SizedBox(
              height: 8.0,
            ),
            _buildSignInNowButton()
          ],
        ),
      ),
    );
  }

  /// login button
  Container _buildSignUpButton(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () async {
          if (key1.currentState.validate() &&
              key2.currentState.validate() &&
              key3.currentState.validate()) {
            key1.currentState.save();
            key2.currentState.save();
            key3.currentState.save();
            try {
              AppUser appUser =
              await _appUserVM.signUpWithEmail(email: _email, pwd: _pwd);
            } catch(e){
              errorMessage(message: "Sign up could not made!\n${e.toString()}",durationShort: false);
            }
          } else {
            print("hata var");
          }
        },
        child: Text(
          "Sign Up",
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
              Icons.mail_sharp,
              color: Colors.white,
            ),
            hintText: 'email',
            hintStyle: hintText,
          ),
        ),
      ],
    );
  }

  /// Email box
  Column _buildUsernameBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "username:",
          style: labelText,
        ),
        SizedBox(
          height: 5.0,
        ),
        TextFormField(
          key: key3,
          keyboardType: TextInputType.name,
          onChanged: (String s) => _username = s,
          onSaved: (String s) => _username = s,
          style: TextStyle(
            color: Colors.white,
          ),
          validator: (_value) {
            if (_value.length <= 3) {
              return "username must be greater than 3 characters!";
            } else {
              return null;
            }
          },
          decoration: inputStyle.copyWith(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            hintText: 'username',
            hintStyle: hintText,
          ),
        ),
      ],
    );
  }

  GestureDetector _buildSignInNowButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, NavigationConstants.ROOT,arguments: true);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have account? ",
            style: labelText.copyWith(fontWeight: FontWeight.normal),
          ),
          Text(
            "Sign In Now!",
            style: labelText,
          ),
        ],
      ),),
    );
  }
}
