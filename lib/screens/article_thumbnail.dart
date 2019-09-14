import 'package:flutter/material.dart';
import 'package:news_article/widget/thumbnail.dart';

class ThumbnailArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0
            ),
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Thumbnails()
                );
              },  
              itemCount: 5,
            ),
          );
  }
}