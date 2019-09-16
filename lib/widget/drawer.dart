import 'package:flutter/material.dart';
import 'dart:ui';
import './article_detail.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
            leading: Icon(icon, 
              color: Colors.white,
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'EncodeSansExpanded',
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              onTap: tapHandler,
          );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
        children: <Widget>[
           BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), //this is dependent on the import statment above
                    child: Container(
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1))
                    )
                ),
          Container(
            height: 160,
            child: Image.network('https://i.pinimg.com/originals/a7/e0/de/a7e0deffdb03fb4f24f242e4e5735a65.jpg'),
          ),
          SizedBox(height: 10),
          buildListTile(
            'Register For Events',
            Icons.web_asset ,
            () {
               Navigator.of(context).pushNamed(ArticleDetail.routeName);
            }
          ),
          Divider(color:Colors.white,height: 4),
          buildListTile(
            'Logout',
            Icons.transit_enterexit,
            () {
              Navigator.of(context).pushNamed('/');
            }
          ),
          Divider(color:Colors.white,height: 4),
        ],
      ),
      ),
    );
  }
}