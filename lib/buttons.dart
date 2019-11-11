 import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'text.dart';
import 'screen_args.dart';
import 'onboard.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

enum CounterEvent { increment, decrement }


class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => -1;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state*-1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}


class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Container(
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, status) {
          String _status = "";
          if (status < 0)
            _status = "not broadcasting";
          else
            _status = "broadcasting";
          return Center(
            child: Text(
              _status,
              style:headerTextStyle.copyWith(fontSize: 26),
            ),
          );
        },
      ),
        );
  }
}


class ActionButton extends StatelessWidget{
  final CounterBloc bp;
    final String title;
    final Icon icon;
    final double height;
  const ActionButton({@required this.title, @required this.icon, @required this.height, @required this.bp});

  @override
  Widget build(BuildContext context) {
        return SizedBox(
            height: this.height,
              width: MediaQuery.of(context).size.width / 1.2,
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 1.2,                  
                  child:FlatButton.icon(
                    
                    color: Colors.blue[600],
                      icon: this.icon,
                      label: Shimmer.fromColors(baseColor: Colors.white, highlightColor: Colors.grey[100], child:Text(title,style: headerTextStyle)),
                      onPressed: (){ bp.add(CounterEvent.decrement);}
                    ),
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