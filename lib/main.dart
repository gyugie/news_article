import 'package:flutter/material.dart';
import './screens/tab_screens.dart';
import './screens/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amber,
        // canvasColor: Color.fromRGBO(242,244,186, 1),
        fontFamily: 'EncodeSansExpanded',
        textTheme: ThemeData.light().textTheme.copyWith(
           body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
            ),
            title: TextStyle(
              fontFamily: 'BungeeInline',
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginPage(),
        TabsScreens.routeName : (ctx) => TabsScreens(),
      },
    );
  }
}