import 'package:flutter/material.dart';
import './article_detail.dart';

class Article extends StatelessWidget {

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
        leading: Image.network('https://asset.kompas.com/crops/FwQf8MIhaM_-zV-jsJxziFLCSqc=/0x0:900x600/750x500/data/photo/2017/05/17/375992809.jpg'),
        title: Text(
          'KTM LAUNCHES A NEW GENERATION',
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
                        TextSpan(text: ' gnarliest terrain and in deepest  \n\n'),
                        TextSpan(text: 'Sep 12 2019')
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