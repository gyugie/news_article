import 'package:flutter/material.dart';
import './article_screens.dart';
import '../event/event_screens.dart';

class TabsScreens extends StatefulWidget {
  static const routeName = 'tabs-screens';
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  List <Map<String, Object>> _pages;
  int _selectedMenu = 0;

  @override
  void initState(){
    _pages = [
      {
        'page'  : ArticleScreens(),
        'title' : 'Article'
      },
      {
        'page'  : EventScreens(),
        'title' : 'Events'
      }
    ];

    super.initState();
  }

 void _selectedPage(int index){
   setState(() {
     _selectedMenu = index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedMenu]['title']),
      ),
      body: _pages[_selectedMenu]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.white,
        currentIndex: _selectedMenu,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available),
            title: Text('News')
          )
        ],
      ),
      
    );
  }
}