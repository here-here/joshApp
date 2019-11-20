
//import 'package:bfa/text.dart';
import 'package:flutter/material.dart';
import 'photo.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 120,
      child: Text('Course'),
      decoration: BoxDecoration(
        color: Colors.black38
      )
    );
  }
}

class CheckIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Check In", style: headerTextStyle)
      ),
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Course(),
              Course(),
              Course()
            ],
          )
        ],
      )
    );    
  }
}