import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './article_detail.dart';

class Article extends StatelessWidget {
  final String post_id;
  final String post_title;
  final String post_description;
  final String image_url;
  final String created_date;
  final String is_favorite;

  Article({
    this.post_id, 
    this.post_title, 
    this.post_description,
    this.is_favorite,
    this.image_url, 
    this.created_date,
    });
  
  
  void selectArticle(BuildContext ctx, String post_id){
    Navigator.of(ctx).pushNamed(
      ArticleDetail.routeName,
      arguments: post_id
      );
  }

  @override
  Widget build(BuildContext context) {
  var parsedDate = DateTime.parse(created_date);

    return Card(
      elevation: 5,
      child: ListTile(
         onTap: () => selectArticle(context, post_id),
         contentPadding: EdgeInsets.all(10),
        leading: Image.network(image_url),
        title: Text(
          '${post_title} \n' ,
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'EncodeSansExpanded',
              fontWeight: FontWeight.bold
            ),
          ),
        subtitle: Text(new DateFormat.yMMMd().format(parsedDate)),
        trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){},
            ),
      ),
    );
  }
}