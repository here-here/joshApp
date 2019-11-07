 import 'package:flutter/material.dart';
import 'text.dart';
import 'screen_args.dart';
import 'onboard.dart';

class Settings extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        height: 120,
        child:
        DrawerHeader(
          child: Text('Hello'),
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
      ),
      ListTile(
        title: Text('Settings'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);

        },
      ),
      ListTile(
        title: Text('Reports'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);

        },
      ),
      ListTile(
        title: Text('Help'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);

        },
      ),
      ListTile(
        title: Text('Logout'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);

        },
      ),
    ],
  ),
);



  }
}

class Button extends StatelessWidget{
  final String title;
  final Widget goTo;
  const Button({@required this.title, @required this.goTo});
  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 5.0,
      borderRadius:  BorderRadius.circular(32.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
         onPressed: () {
                // When the user taps the button, navigate to the specific route
                // and provide the arguments as part of the RouteSettings.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => goTo,
                    // Pass the arguments as part of the RouteSettings. The
                    // ExtractArgumentScreen reads the arguments from these
                    // settings.
                    settings: RouteSettings(
                      arguments: ScreenArguments(
                        'n/a',
                        'n/a',
                      ),
                    ),
                  ),
                );
              },
        child: Text(this.title,
          textAlign: TextAlign.center,
        style: headerTextStyle.copyWith(color: Colors.black))
        ),
    );

  }
}