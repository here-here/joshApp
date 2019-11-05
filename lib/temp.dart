Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/Logo.png"), fit: BoxFit.cover),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextSection(Text('Here Here')),
                      TextSection(Text('Attendance')),
                      RaisedButton(
//                        padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 5.0),
                        color: Colors.blue,
                        child: Text("Test"),
                        onPressed: () {myFunction();},
                      ),
                      RaisedButton(
                        color: Colors.red,
                        child: Text("get beacons"),
                        onPressed: () {myFunction2();},
                      ),

                    ],
                  ),
                ),
              )

            )],
        )
    );
  }