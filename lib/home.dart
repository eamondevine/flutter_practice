import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_card/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:coffee_card/services/auth.dart';
import 'package:coffee_card/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Coffee Card',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.brown[400],
          centerTitle: true,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text(
                'logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
