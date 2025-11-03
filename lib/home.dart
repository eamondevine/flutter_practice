import 'package:coffee_card/models/brew.dart';
import 'package:coffee_card/brew_list.dart';
import 'package:coffee_card/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:coffee_card/services/auth.dart';
import 'package:coffee_card/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: SettingsForm(),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: [],
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
            TextButton.icon(
              icon: Icon(Icons.settings, color: Colors.white),
              label: Text('settings', style: TextStyle(color: Colors.white)),
              onPressed: () => {showSettingsPanel()},
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
