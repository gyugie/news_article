import 'package:flutter/material.dart';
import './article_list.dart';
import './article_thumbnail.dart';

class ArticleScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ThumbnailArticle(),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('List Post', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
                )
              ),
            ),
            ArticleList()
          ],
        ),
      )
    );
  }
}

