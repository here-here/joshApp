import 'dart:developer';

import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'TextSection.dart';
import 'ImageBanner.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';
import 'photo.dart';
import 'buttons.dart';

class BroadCast extends StatelessWidget
{
  BeaconBroadcast beaconBroadcast = BeaconBroadcast();
  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription _subscription;
  BluetoothDevice device;
  bool started = false;
  @override
  Widget build(BuildContext context) {
        final CounterBloc bp = CounterBloc();
    Size size = MediaQuery.of(context).size;
    double height = size.height/1.5;
    return Scaffold(
      body:
      Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
            padding: EdgeInsets.all(8.0),
            child:
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 400,
              color: Colors.red[400],
              child: 
                BlocProvider<CounterBloc>(
                  builder: (context) => bp,
                  child: CounterPage(),
                 )
 
             // child: Center(child:  Text("Waiting...", style: headerTextStyle.copyWith(fontSize: 30))),
            ),
            ),
            ActionButton(bp: bp, height: 200, title: "Broadcast", icon: Icon(Icons.bluetooth, color: Colors.white,)).build(context),
          ],
        )
      )

    );
  }
}