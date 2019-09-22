import 'package:flutter/material.dart';
import 'package:news_article/sigin.dart';
import 'package:news_article/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSign           = true;

  @override
  void _setDisplay(String display){
    if(display == 'login'){
      setState(() {
        isSign = true;
      });
    } else {
      setState(() {
        isSign = false;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;

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
           Center(
             child: Container(
               child: ListView(
                 children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         ButtonTheme(
                            minWidth: 150.0,
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                _setDisplay('login');
                              },
                              child: Text("Sign In"),
                            ),
                          ),
                         SizedBox(width: 5),
                         ButtonTheme(
                          minWidth: 150.0,
                          height: 40.0,
                          child: RaisedButton(
                            onPressed: () {
                               _setDisplay('signup');
                            },
                            child: Text("Sign In"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        isSign ? SignIn() : SignUp(),
                      ],
                    ),
                  )
                  
                 ],
               )
             ),
           )
          ],
        )
    );
  }
}

// Center(
//              child: Container(
//                 width: 300,
//                 child: ListView(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(top: 250),
//                     ),
//                      emailText,
//                      emailAlert ? 
//                       Container( 
//                         padding: EdgeInsets.only(top: 5, left: 20),
//                         child: Text(
//                           'Email is required...!', style: TextStyle(color: Colors.red)
//                         ),
//                       )
//                     : Container(),
//                     SizedBox( height: 15),
//                     passwordText,
//                      passwordAlert ? 
//                       Container( 
//                         padding: EdgeInsets.only(top: 5, left: 20),
//                         child: Text(
//                           'Password is required...!', style: TextStyle(color: Colors.red)
//                         ),
//                       )
//                     : Container(),
//                     accountWrong ? Container( 
//                         padding: EdgeInsets.only(top: 5, left: 20),
//                         child: Text(
//                           'Please check youre account is wrong...!', style: TextStyle(color: Colors.red)
//                         ),
//                       )
//                     : Container(),
//                     SizedBox(height: 20),
//                     Container(
//                       height: 35.0,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: <Widget>[
//                           RaisedButton(
//                             color: Colors.white,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                             onPressed: (){
//                               _checkingLogged();
//                               CircularProgressIndicator();

//                               // if(_userEmail.text == ''){
//                               //   _alertMessage('email');
//                               // }else if(_userPassword.text == ''){
//                               //    _alertMessage('password');
//                               // }

//                             },
//                             child: Text("Sign In"),
//                           ),
//                           SizedBox(width: 10),
//                           RaisedButton(
//                             color: Colors.orangeAccent,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                             onPressed: () {
                            
//                             },
//                             child: Text("Sign Up"),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               ),
//            ),