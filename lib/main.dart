import 'package:flutter/material.dart';
import 'package:first_vs_code_app/screens/home_page.dart';
import 'package:first_vs_code_app/screens/locations_page.dart';
import 'package:first_vs_code_app/screens/loading_page.dart';

void main() {
  runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/locations': (context) => const Locations()
  },
  ));
}
