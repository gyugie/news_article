import 'package:flutter/material.dart';
import './screens/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginPage()
      },
    );
  }
}