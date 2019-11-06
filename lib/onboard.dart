import 'package:flutter/material.dart';
import 'screen_args.dart';
import 'photo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class SignUpView extends StatelessWidget {
  static const routeName = '/SignUpView';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
      TextStyle style = TextStyle(fontFamily:  'Montserrat', fontSize: 20.0);

      final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding:
          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "userID",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(2.0))),
    );

    final passwordField = TextField(
      obscureText: true,


      style: style,
      decoration: InputDecoration(
                      fillColor: Colors.white,
        filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(2.0))),
    );
    return Scaffold(
      body: Center(
        child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        margin: EdgeInsets.only(top:3.0),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("Sign up!", style: headerTextStyle.copyWith(fontSize: 48)),
            ),
             SizedBox(
                  height: 50.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15.0),
                emailField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
            // A button that navigates to a named route that. The named route
            // extracts the arguments by itself.

          ],
        ),
        ),
      ),
      ),
     
    );
  }
}


