import 'package:flutter/material.dart';
import '../widget/event.dart';

class EventScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return Event();
        },
        itemCount: 5,
        ),
    );
  }
}