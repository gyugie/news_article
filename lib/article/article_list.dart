
import 'package:flutter/material.dart';
import '../model/postModel.dart';
import '../services/postService.dart';
import '../widget/article.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  PostService postService;

  @override
  void initState(){
    super.initState();
    postService = PostService();
  }

  @override
  Widget build(BuildContext context) {
  //  ApiServices().eventList().then((value) => print(value) );
    return Container(
      padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0
              ),
      height: MediaQuery.of(context).size.height * 0.70,
      child: FutureBuilder(
        future: postService.postList(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
          if(snapshot.hasError){
           return Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Text("Something wrong with message: ${snapshot.error.toString()}"),
              ),
            );
          } else if(snapshot.connectionState == ConnectionState.done){
            List<Post> post = snapshot.data;
            return _buildListView(post);
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
    );
  }

  _buildListView(List<Post> posts){
    return Container(
        child : ListView.builder(
          itemBuilder: (ctx, index){
            Post post = posts[index];
            return Article(
              post_id: post.post_id.toString(),
              post_title: post.post_title,
              post_description: post.post_description,
              image_url: post.image_url,
              is_favorite: post.is_favorite,
              created_date: post.created_date,
            );
          },
          itemCount: posts.length,
        )
      );
  }
}
