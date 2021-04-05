import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/input_decoration.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:flutter/material.dart';

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
            _buildSignUpButton(),
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
  Container _buildSignUpButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          if (key1.currentState.validate() &&
              key2.currentState.validate() &&
              key3.currentState.validate()) {
            key1.currentState.save();
            key2.currentState.save();
            key3.currentState.save();
            // ToDo sign up process
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
        // go to sign in page
      },
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
      ),
    );
  }
}
