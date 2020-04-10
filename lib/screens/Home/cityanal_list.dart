import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cityanal/models/cityanal.dart';
import 'package:cityanal/screens/Home/cityanal_tile.dart';

class CityanalList extends StatefulWidget {
  @override
  _CityanalListState createState() => _CityanalListState();
}

class _CityanalListState extends State<CityanalList> {
  @override
  Widget build(BuildContext context) {
    final cityanal=Provider.of<List<Cityanal>>(context);
    //print(cityanal.documents);
   // cityanal.forEach((cityanal){
    //  print(cityanal.name);
     // print(cityanal.sugars);
      //print(cityanal.strength);
    //});
    return ListView.builder(
        itemCount: cityanal.length,
        itemBuilder: (context,index){
          return CityanalTile(cityanal:cityanal[index]);
        },
    );
  }
}
