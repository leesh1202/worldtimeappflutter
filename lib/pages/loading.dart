import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'dart:convert';
import 'package:World_timeapp/service/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Mumbai', flag: 'india.jpg', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.redAccent,
          size: 80.0,
        ),
      ),
    );
  }
}
