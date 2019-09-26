import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/postModel.dart';

class ApiServices{
  final String baseUrl = "http://10.0.2.2:3000";
  Client client         = Client();
  final Object headers = {"content-type": "application/x-www-form-urlencoded"};

  Future getUser() async {
    final response = await client.get("${baseUrl}/api/user");
    if(response.statusCode == 200){
      return response.body;
    } else {
      return null;
    }
  }

  Future <bool> registerUser(String username, String email, String password) async {
    final Object payload = {'username': username, 'email': email, 'password': password};

    final response = await client.post("${baseUrl}/api/user",
                            headers: headers ,
                            body: payload,
    );

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }

  }

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