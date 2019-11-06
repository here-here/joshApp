import 'package:bfa/teacher_view.dart';
import 'package:flutter/material.dart';
import 'teacher_view.dart';
import 'blu.dart';
import 'text.dart';
import 'extractargs.dart';
import 'screen_args.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

 

    return MaterialApp(
      // Provide a function to handle named routes. Use this function to
      // identify the named route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == PassArgumentsScreen.routeName) {
          // Cast the arguments to the correct type: ScreenArguments.
          final ScreenArguments args = settings.arguments;

          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
      },
      title: 'Navigation with Arguments',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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

    final loginButton = Material(
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
                    builder: (context) => TeacherView(),
                    // Pass the arguments as part of the RouteSettings. The
                    // ExtractArgumentScreen reads the arguments from these
                    // settings.
                    settings: RouteSettings(
                      arguments: ScreenArguments(
                        'Rick',
                        'auth',
                      ),
                    ),
                  ),
                );
              },
        child: Text("Login",
          textAlign: TextAlign.center,
        style: headerTextStyle.copyWith(color: Colors.black))
        ),
    );
    return
     Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      // ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        margin: EdgeInsets.only(top:3.0),
        color: Colors.yellowAccent,
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("Here Here", style: headerTextStyle.copyWith(fontSize: 48)),
            ),
             SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
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




// A Widget that accepts the necessary arguments via the constructor.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}




