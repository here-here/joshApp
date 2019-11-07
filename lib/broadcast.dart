import 'dart:async';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'TextSection.dart';
import 'ImageBanner.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';


class BroadCast extends StatelessWidget
{
  BeaconBroadcast beaconBroadcast = BeaconBroadcast();
  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription _subscription;
  BluetoothDevice device;

  bool started = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height/1.5;
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Stack(
          children: [

            Scaffold(
              backgroundColor: Colors.black,
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/Logo.png"), fit: BoxFit.cover),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500.0,
                        height: 500.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.blue,
                          highlightColor: Colors.lightBlue,
                          
                          child: Icon(Icons.bluetooth_searching, size: 400)
                        ),
                      ),

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

  myFunction()
  {
    if (started)
      {
        print('stopped');
        beaconBroadcast.stop();
        started = false;
        return;
      }
    print('test');
    started = true;
    beaconBroadcast
      .setUUID('39ED98FF-2900-441A-802F-9C398FC199D2')
      .setMajorId(1)
      .setMinorId(100)
      .start();
  }

  void init(Stream stream)
  {
//    _subscription = stream.listen(() {myFunction2();});
  }

   myFunction2()
  {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    _subscription = flutterBlue.scanResults.listen((scanResult) {
      // do something with scan result
      var devicestr = scanResult.first;
      if (devicestr != null)
        print(devicestr.device.id);
      else
        print('no devices found');
    });

// Stop scanning
    flutterBlue.stopScan();
    _subscription.cancel();
  }
}