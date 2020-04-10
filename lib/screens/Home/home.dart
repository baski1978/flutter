import 'package:cityanal/models/cityanal.dart';
import 'package:cityanal/services/auth.dart';
import 'package:cityanal/models/cityanal.dart';
import 'package:flutter/material.dart';
import 'package:cityanal/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cityanal/screens/Home/cityanal_list.dart';


class  Home extends StatelessWidget {

  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
  return StreamProvider<List<Cityanal>>.value(
    value: DatabaseService().cityanal,
    child:Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('City Analytics'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('logout'),
          onPressed: () async {
            await _auth.signOut();
          },
        )
      ],
    ),
    body: CityanalList(),
  ));
  }
}
