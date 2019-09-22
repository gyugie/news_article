import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './widget/tab_screens.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey        = GlobalKey<FormState>();
  final  _userEmail     = TextEditingController();
  final  _userPassword  = TextEditingController();
  bool isLoading        = false;
  bool emailAlert       = false;
  bool passwordAlert    = false;
  bool accountWrong     = false;

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userEmail.dispose();
    _userPassword.dispose();
    super.dispose();
  }

  void _alertMessage(){
    setState(() {
        accountWrong = true;
    });
  }

  Future<void> _checkingLogged() async{
    setState(() {
      isLoading = true;
    });
    try{

      AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _userEmail.text, password: _userPassword.text);
      Navigator.of(context).pushReplacementNamed( TabsScreens.routeName );

      setState(() {
        isLoading = false;
      });

    }catch(e){
      _alertMessage();
      setState(() {
        isLoading = false;
      });
    }
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                          fontSize: 12
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
                          return 'Email Is Required!';
                          }
                        },
                        style: new TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 12
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
        height: size.height * 0.35,
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  emailText,
                  SizedBox(height: 5),
                  passwordText,
                  accountWrong ? Container( 
                      padding: EdgeInsets.only(top: 5, left: 20),
                      child: Text(
                        'Please check youre account is wrong...!', style: TextStyle(color: Colors.red)
                      ),
                    )
                  : Container(),
                  SizedBox(height: 35),
                   ButtonTheme(
                    minWidth: 100.0,
                    height: 40.0,
                    child: RaisedButton(
                      color: Colors.orange[700],
                      onPressed: () {
                        _formKey.currentState.validate();
                        _checkingLogged();
                      },
                       child:  isLoading ? CircularProgressIndicator() : Text('Login', style: TextStyle(color: Colors.white),)
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