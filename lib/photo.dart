import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screen_args.dart';
import 'broadcast.dart';


Future<List<Course>> fetchCourses(http.Client client) async {
  final response =
      await client.get('https://api.myjson.com/bins/fibeg');

  // Use the compute function to run parseCourses in a separate isolate
  return compute(parseCourses, response.body);
}

// A function that will convert a response body into a List<Course>
List<Course> parseCourses(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Course>((json) => Course.fromJson(json)).toList();
}

class Course {
  final int userId;
  final int id;
  final String title;
  final String body;

  Course({this.userId, this.id, this.title, this.body});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title, style: headerTextStyle,overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        child: FutureBuilder<List<Course>>(
          future: fetchCourses(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? CoursesList(Courses: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
    );
  }
}

class CoursesList extends StatelessWidget {
  final List<Course> Courses;

  CoursesList({Key key, this.Courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Courses.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              margin: EdgeInsets.only(top:3.0),
                color: Colors.black,
                alignment: Alignment.center,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(Courses[index].title, style: headerTextStyle,overflow: TextOverflow.ellipsis,),
                        subtitle: Text(Courses[index].body, style: subHeaderTextStyle),
                      ),
                      ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[                         
                            FlatButton(
                            //color: Colors.white,
                            child: new Icon(Icons.assignment, color: Colors.white),
                             onPressed: () {
                                  // When the user taps the button, navigate to the specific route
                                  // and provide the arguments as part of the RouteSettings.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BroadCast(),
                                      // Pass the arguments as part of the RouteSettings. The
                                      // ExtractArgumentScreen reads the arguments from these
                                      // settings.
                                      settings: RouteSettings(
                                        arguments: ScreenArguments(
                                          Courses[index].title,
                                          Courses[index].body
                                        ),
                                      ),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                ),
          ],
        );
      },
    );
  }
}



final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);

final headerTextStyle = baseTextStyle.copyWith(
  color:  Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w600
);

final regularTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize: 12.0,
  fontWeight: FontWeight.w400
);

final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 14.0
);