import 'package:cityanal/screens/Authenticate/authenticate.dart';
import 'package:cityanal/screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:cityanal/models/users.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate
    final user = Provider.of<User>(context);
    if(user==null) {
      return Authenticate();
    } else{
      return Home();
    }
  }
}
