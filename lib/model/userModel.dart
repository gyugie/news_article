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

}

