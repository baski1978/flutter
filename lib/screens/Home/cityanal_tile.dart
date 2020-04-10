import 'package:flutter/material.dart';
import 'package:cityanal/models/cityanal.dart';

class CityanalTile extends StatelessWidget {
  final Cityanal cityanal;
  CityanalTile({this.cityanal});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[cityanal.strength],
            //backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(cityanal.name),
          subtitle: Text('Takes ${cityanal.sugars} Sugar(s)'),
        ),
      ),
    );
  }
}