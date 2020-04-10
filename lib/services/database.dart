import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cityanal/models/cityanal.dart';
class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference cityanalCollection = Firestore.instance.collection('cityanal');
  Future updateUserData( String sugars, String name, int strength) async{
    return await cityanalCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  List<Cityanal> _cityanalListSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Cityanal(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars:doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  Stream<List<Cityanal>> get cityanal {
    return cityanalCollection.snapshots()
        .map(_cityanalListSnapshot);
  }
}

