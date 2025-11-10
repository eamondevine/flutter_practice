import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:coffee_card/models/order.dart';
import 'package:coffee_card/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference<Map<String, dynamic>> orderCollection =
      FirebaseFirestore.instance.collection('orders');
  Future updateUserData(String dish, String name, int price) async {
    return await orderCollection.doc(uid).set({
      'dish': dish,
      'name': name,
      'price': price,
    });
  }

  // brew list from snapshot

  List<Order> _orderListFromSnapshot(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) {
    return snapshot.docs.map((doc) {
      return Order(
        name: doc.get('name') ?? '',
        dish: doc.get('dish') ?? '',
        price: doc.get('price') ?? '0',
      );
    }).toList();
  }

  // get userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid!,
      dish: snapshot.get('dish'),
      name: snapshot.get('name'),
      price: snapshot.get('price'),
    );
  }

  // get brews stream
  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return orderCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
