import 'package:fandom_app/util/components/box_decoration.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _pwd = "";
  String _email = "";

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
                  gradient: LinearGradient(
                      colors: [Colors.deepOrangeAccent, Colors.deepOrange]),
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
              height: 12.0,
            ),
            _buildEmailBox(),
            SizedBox(
              height: 24.0,
            ),
            _buildPasswordBox(),
            _buildLoginButton(),
            Text("or login with"),
            buildGoogleLoginButton()
          ],
        ),
      ),
    );
  }

  GestureDetector buildGoogleLoginButton() {
    return GestureDetector(
      onTap: (){
        // on progress
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
  Container _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          // on progress
        },
        child: Text(
          "Log In",
          style: labelText.copyWith(
            color: Colors.white,
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
          alignment: Alignment.centerLeft,
          decoration: boxStyle,
          height: 50.0,
          child: TextField(
            //keyboardType: TextInputType.pas,
            obscureText: true,
            onChanged: (String s) => _pwd = s,
            onSubmitted: (String s) => _pwd = s,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 12.0),
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
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.name,
            onChanged: (String s) => _email = s,
            onSubmitted: (String s) => _email = s,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'email',
              hintStyle: hintText,
            ),
          ),
        ),
      ],
    );
  }

  /// login button
  Container _buildGoogleLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          // on progress
        },
        child: Text(
          "Log In",
          style: labelText.copyWith(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
