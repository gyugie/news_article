import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleDetail extends StatefulWidget {
  static const routeName = 'detail-article';
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  final f = new DateFormat('yyyy-MM-dd hh:mm');


  Widget _myButtonAction(Icon icon, String btnName){
    return  SizedBox(
              width: 50.0,
              height: 50.0,
              child: FloatingActionButton(
                heroTag: btnName,
                  child: icon,
                onPressed: () {},
              ),
            );
  }

  Widget _descriptionText(String description){
    return Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                child: Container(
                  child:Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                        style: TextStyle(fontSize: 16),
                      ),
                ),
              )
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Article'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7dGYEqU62iL254Ihi7q86eXt1hmo9eG277eTjpmysYyfxEIYk',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        "Title",
                        style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.timer, color: Colors.black87, size: 16),
                            SizedBox(width: 5),
                            Text(
                              new DateFormat.yMMMd().format(new DateTime.now()),
                              style: TextStyle(color: Colors.black87, fontSize: 12.0),
                            ),
                            
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                         _myButtonAction(Icon(Icons.star, color: Colors.white), 'btn1'),
                        SizedBox(width: 10),
                        _myButtonAction(Icon(Icons.bookmark, color: Colors.white), 'btn2'),
                      ],
                    )
                  ),
                ],
              ),
            ),
            _descriptionText('text'),
          ],
        ),
      )
    );
  }
}


