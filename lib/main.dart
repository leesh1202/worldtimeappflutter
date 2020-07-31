import 'package:World_timeapp/pages/choose_location.dart';
import 'package:World_timeapp/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:World_timeapp/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
