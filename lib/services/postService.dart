import 'package:http/http.dart' show Client;
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

}