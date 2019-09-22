import 'package:flutter/material.dart';
import 'package:news_article/loginPage.dart';
import './services/apiServices.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ApiServices _apiServices = ApiServices();
  final _formKey        = GlobalKey<FormState>();
  final  _userName      = TextEditingController();
  final  _userEmail     = TextEditingController();
  final  _userPassword  = TextEditingController();
  bool isLoading        = false;
  bool emailAlert       = false;
  bool passwordAlert    = false;
  bool accountWrong     = false;

  void _resgisterUser(){
    setState(() {
      isLoading = true;
    });

    _apiServices.registerUser( _userName.text, _userEmail.text, _userPassword.text).then((result) {
        
         setState(() {
            isLoading = false;
          }); 

        if(result){
          final snackBar = SnackBar(
              content: Text('Register Success'),
              action: SnackBarAction(
                label: 'Sign in',
                onPressed: () {
                  // Some code to undo the change.
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            );
        Scaffold.of(context).showSnackBar(snackBar);
        }else{
          final snackBar =  SnackBar(
              content: Text('Register Failed!'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );
        Scaffold.of(context).showSnackBar(snackBar);
        }

    });

  }

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
                        obscureText: true,
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
    // ApiServices().getUser().then((value) => print(value));

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
                          if(_formKey.currentState.validate()){
                            _resgisterUser();
                          };
                        },
                        child: isLoading ? CircularProgressIndicator() : Text('Register', style: TextStyle(color: Colors.white),)
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