import 'package:flutter/material.dart';
import './article_detail.dart';

class Event extends StatelessWidget {

  void selectArticle(BuildContext ctx){
    Navigator.of(ctx).pushNamed(ArticleDetail.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectArticle(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      margin: EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0, 0.5)
              )
            ],
        ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7dGYEqU62iL254Ihi7q86eXt1hmo9eG277eTjpmysYyfxEIYk',
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Positioned(
                    bottom: 25,
                    right: 0,
                    left: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal:20
                      ),
                      child: Text(
                        'KTM is Possible for enduro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}