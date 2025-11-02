import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_card/models/brew.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance
      .collection('brews');
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((d) {
      return Brew(name: d, sugars: sugars, strength: strength)
    })
  }

  // get brews query
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
