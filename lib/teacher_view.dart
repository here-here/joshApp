import 'package:flutter/material.dart';
import 'screen_args.dart';
import 'photo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class TeacherView extends StatelessWidget {
  static const routeName = '/TeacherView';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
                backgroundColor: Colors.black,
        title: Text("My Classes", style: headerTextStyle)
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


