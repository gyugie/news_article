import 'package:flutter/material.dart';
import './article_detail.dart';

class Article extends StatelessWidget {
  final String event_id;
  final String event_title;
  final String event_description;
  final String image_url;
  final String created_date;

  Article({
    this.event_id, 
    this.event_title, 
    this.event_description,
    this.image_url, 
    this.created_date
    });

  void selectArticle(BuildContext ctx){
    Navigator.of(ctx).pushNamed(ArticleDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
         onTap: () => selectArticle(context),
         contentPadding: EdgeInsets.all(10),
        leading: Image.network(image_url),
        title: Text(
          event_title,
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'EncodeSansExpanded',
              fontWeight: FontWeight.bold
            ),
          ),
        subtitle: RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: '\n ${created_date}')
                      ],
                    ),
                  ),
        trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){},
            ),
      ),
    );
  }
}