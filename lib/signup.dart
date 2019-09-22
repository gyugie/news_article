import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey        = GlobalKey<FormState>();
  final  _userName      = TextEditingController();
  final  _userEmail     = TextEditingController();
  final  _userPassword  = TextEditingController();
  bool isLoading        = false;
  bool emailAlert       = false;
  bool passwordAlert    = false;
  bool accountWrong     = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usernameText = TextFormField(
                      controller: _userName,
                      validator: (input){
                        if(input.isEmpty){
                          return 'Username Is Required!';
                        }
                      },
                      style: TextStyle(
                        color: Colors.white
                        ),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, 
                          horizontal: 20.0
                          ),
                        fillColor: Colors.white, 
                         focusedBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.orangeAccent),
                          ),
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),   
                        ),  
                      ),
                  );
    final emailText = TextFormField(
                        controller: _userEmail,
                        validator: (input){
                          if(input.isEmpty){
                            return 'Email Is Required!';
                          }
                        },
                        style: TextStyle(
                          color: Colors.white
                          ),
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0, 
                            horizontal: 20.0
                            ),
                          fillColor: Colors.white, 
                          focusedBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Colors.orangeAccent),
                            ),
                          enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),   
                          ),  
                        ),
                    );
    final passwordText = TextFormField(
                        controller: _userPassword,
                         validator: (input){
                          if(input.isEmpty){
                            return 'Password Is Required!';
                          }
                        },
                        style: new TextStyle(color: Colors.white),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: new TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            ),
                          fillColor: Colors.white, 
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                color: Colors.red
                              )
                            ),
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, 
                            horizontal: 20.0
                            ),
                          focusedBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.orangeAccent),
                          ),
                          enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),   
                          ),  
                        ),
                    );

    return Card(
      color:  Colors.black.withOpacity(0.4),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: size.width * 0.80,
        height: size.height * 0.53,
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  usernameText,
                  SizedBox(height: 20),
                  emailText,
                  SizedBox(height: 20),
                  passwordText,
                  SizedBox(height: 35),
                  ButtonTheme(
                      minWidth: 100.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: Colors.orange[700],
                        onPressed: () {
                          _formKey.currentState.validate();
                        },
                        child: Text('Register', style: TextStyle(color: Colors.white),)
                      ),
                    ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}