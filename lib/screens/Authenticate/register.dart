import 'dart:math';

import 'package:cityanal/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cityanal/shared/constants.dart';
import 'package:cityanal/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to City Analytics'),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){ widget.toggleView();},
              icon: Icon(Icons.person),
              label: Text('Sign In'))

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
                validator: (val) => val.isEmpty ? 'please enter the email': null ,
                onChanged: (val){
                  setState(() => email = val );
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:textInputdecoraion.copyWith(hintText: 'password'),
                obscureText: true,
                validator: (val) => val.length<8 ? 'Enter 8 characeters password': null ,
                onChanged: (val){
                  setState(() => password = val );
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Register', style: TextStyle(color: Colors.white),),
                onPressed: () async{
                  if(_formkey.currentState.validate()){
                    setState(()=> loading=true);
                    dynamic result = await _auth.registerWithEmailAndPass(email,password);
                    if (result == null){
                      setState((){
                       error='Please give correct values3';
                      loading=false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 10.0),
              Text(error,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
