import 'package:flutter/material.dart';
import 'package:global_time/pages/choose_location.dart';
import 'package:global_time/pages/home.dart';
import 'package:global_time/pages/loading.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    },
  ));


