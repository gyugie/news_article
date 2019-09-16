import 'package:flutter/material.dart';
import './widget/tab_screens.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  _userEmail     = TextEditingController();
  final  _userPassword  = TextEditingController();
  bool isLoading        = false;
  bool emailAlert       = false;
  bool passwordAlert    = false;
  bool accountWrong     = false;


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userEmail.dispose();
    _userPassword.dispose();
    super.dispose();
  }

  void _alertMessage(String fieldText){
    setState(() {
      if(fieldText == 'email'){
          emailAlert = true;
           passwordAlert = false;
      }else if(fieldText == 'password'){
          passwordAlert = true;
          emailAlert = false;
      } else if(fieldText == 'wrong'){
        accountWrong = true;
      }
    });
  }

  void _checkingLogged(){
    setState(() {
      isLoading = true;
    });

 
    
  }

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  final emailText = TextFormField(
                      controller: _userEmail,
                      style: TextStyle(
                        color: Colors.white
                        ),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, 
                          horizontal: 20.0
                          ),
                        fillColor: Colors.white, 
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, 
                            width: 1.0
                            ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white, 
                            width: 1.0
                            ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                  );

  final passwordText = TextFormField(
                        controller: _userPassword,
                        style: new TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: new TextStyle(color: Colors.white),
                          fillColor: Colors.white, 
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, 
                            horizontal: 20.0
                            ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, 
                              width: 1.0
                              ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white, 
                              width: 1.0
                              ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                    );

    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                child: new Image.asset('assets/images/image-login.jpg', 
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              ),
            ),
           isLoading ? Center( child: CircularProgressIndicator()) : Center(),
           Center(
             child: Container(
                width: 300,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 250),
                    ),
                     emailText,
                     emailAlert ? 
                      Container( 
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text(
                          'Email is required...!', style: TextStyle(color: Colors.red)
                        ),
                      )
                    : Container(),
                    SizedBox( height: 15),
                    passwordText,
                     passwordAlert ? 
                      Container( 
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text(
                          'Password is required...!', style: TextStyle(color: Colors.red)
                        ),
                      )
                    : Container(),
                    accountWrong ? Container( 
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text(
                          'Please check youre account is wrong...!', style: TextStyle(color: Colors.red)
                        ),
                      )
                    : Container(),
                    SizedBox(height: 20),
                    Container(
                      height: 35.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            onPressed: (){
                              if(_userEmail.text == 'mugypleci@gmail.com' && _userPassword.text == '123'){
                                _checkingLogged();
                                 Navigator.of(context).pushReplacementNamed(
                                    TabsScreens.routeName
                                 );
                              } else {
                                _alertMessage('wrong');
                              }
                              
                              if(_userEmail.text == ''){
                                _alertMessage('email');
                              }else if(_userPassword.text == ''){
                                 _alertMessage('password');
                              }

                            },
                            child: Text("Sign In"),
                          ),
                          SizedBox(width: 10),
                          RaisedButton(
                            color: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                            
                            },
                            child: Text("Sign Up"),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
           ),
          ],
        )
    );
  }
}

