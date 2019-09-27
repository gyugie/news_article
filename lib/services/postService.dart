import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/postModel.dart';

class PostService{
  final String baseUrl = "http://10.0.2.2:3000";
  Client client         = Client();
  final Object headers = {"content-type": "application/x-www-form-urlencoded"};

  Future <List<Post>> postList() async {
    final response = await client.get("${baseUrl}/post");
     if(response.statusCode == 200){
      // var results = json.decode(response.body);
      return postFromJson(response.body); 
    } else {
      return null;
    }

  }

  Future <Post> getPostById(id) async {
    final response = await client.get("${baseUrl}/api/post/${id}");

    if(response.statusCode == 200){
      var post = json.decode(response.body);
      print(post['data'][0]);
      return Post.fromJson(post['data'][0]);
    } else {
      return null;
    }
  }

}