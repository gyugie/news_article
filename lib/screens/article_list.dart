import 'package:flutter/material.dart';
import '../widget/article.dart';

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0
              ),
      height: MediaQuery.of(context).size.height * 0.70,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          return Article();
        },
        itemCount: 10,
      ),
    );
  }
}