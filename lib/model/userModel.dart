import 'dart:convert';
import 'package:flutter/material.dart';

class User{
  int id;
  String username;
  String email;
  String password;
  String created_date;

  User({
    this.id = null,
    @required String this.username,
    @required String this.email,
    @required String this.password,
    String this.created_date
  });

  // factory User.fromJson(Map<String, dynamic> map){
  //   return User(
  //     id: map['id'],
  //     username: map['username'],
  //     email: map['email'],
  //     password: map['password'],
  //     created_date: map['created_date']
  //   );
  // }

  // Map<String, dynamic> toJson(){
  //   return {
  //     "id": id, 
  //     "username": username, 
  //     "email": email, 
  //     "password":password, 
  //     "created_date": created_date
  //     };
  //   }

  // @override 
  // String toString(){
  //   return 'User {
  //     id: $id,
  //     username: $username, 
  //     email: $email, 
  //     password: $password, 
  //     created_date: $created_date
  //     }';
  // }

}

// List<User> userFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<User>.from(data.map((item) => User.fromJson(item)));
// }

// String userToJson(User data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }