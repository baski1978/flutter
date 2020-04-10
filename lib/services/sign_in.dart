import 'package:cityanal/shared/constants.dart';
import 'package:cityanal/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cityanal/services/auth.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email ='';
  String password = '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to City Analytics'),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){widget.toggleView();},
                          icon: Icon(Icons.person),
                          label: Text('Register'))

        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
              key: _formkey,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:textInputdecoraion,
                    validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                    onChanged: (val){
                      setState(() => email = val );
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:textInputdecoraion.copyWith(hintText: 'password'),
                    obscureText: true,
                    validator: (val) => val.length <8  ? 'Pwd should be atleast 8 chars' : null,
                    onChanged: (val){
                      setState(() => password = val );
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text('Sign in', style: TextStyle(color: Colors.white),),
                    onPressed: () async{
                      if(_formkey.currentState.validate()){
                        setState(()=> loading=true);
                        dynamic result = await _auth.signInWithEmailAndPass(email,password);
                        //print('valid');
                        if (result == null){
                          setState(() {
                            error = 'Please give correct values';
                            loading = false;
                          });
                        }
                      }
                    },
                  ),
                SizedBox(height: 10.0),
                Text(error,
                )
                ],
              ),
        ),
      ),
    );
  }
}
