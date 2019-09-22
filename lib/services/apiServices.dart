// import '../model/userModel.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart';

class ApiServices{
  final String baseUrl = "http://10.0.2.2:3000";
  Client client         = Client();

  Future getUser() async {
    final response = await client.get("${baseUrl}/api/user");
    if(response.statusCode == 200){
      return response.body;
    } else {
      return null;
    }
  }

  Future <bool> registerUser(String username, String email, String password) async {
    print('${username} ${email} ${password}');
    final response = await client.post("${baseUrl}/api/user",
                            headers: {"content-type": "application/x-www-form-urlencoded"},
                            body: {'username': username, 'email': email, 'password': password},
    );

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }

  }

}