import 'package:flutter/material.dart';
import 'screen_args.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(args.title),
      // ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}


