import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/postService.dart';


class ArticleDetail extends StatefulWidget {
  static const routeName = 'detail-article';

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  PostService postService;

  @override
  void initState(){
    super.initState();
    postService = PostService();
  }

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
                  child:Text('${description}\n\n',
                        style: TextStyle(fontSize: 16),
                      ),
                ),
              )
            );
  }
  
  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Article'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
        future: postService.getPostById(postId),
        builder: (BuildContext context, snapshot){
         if(snapshot.hasError){
           return Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Text("Something wrong with message: ${snapshot.error.toString()}"),
              ),
            );
          } else if(snapshot.connectionState == ConnectionState.done){
            var post        = snapshot.data;
            var parsedDate  = DateTime.parse(post.created_date);
            
            return Column(
                    children: <Widget>[
                    Stack(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                  post.image_url,
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${post.post_title}\n',
                                    style: TextStyle(
                                        color: Colors.black, 
                                        fontSize: 16.0, 
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.timer, color: Colors.black87, size: 16),
                                      SizedBox(width: 5),
                                      Text(
                                        new DateFormat.yMMMd().format(parsedDate),
                                        style: TextStyle(
                                          color: Colors.black87, 
                                          fontSize: 12.0
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  _myButtonAction(Icon(Icons.star_border, color: Colors.white), 'btn1'),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                      _descriptionText('${post.post_description}'),
                    ],
                  );
          } else {
             return Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 40,
                child: new CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      )
    );
  }
}
