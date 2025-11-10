import 'dart:developer';
import 'package:coffee_card/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:coffee_card/models/user.dart';
import 'package:coffee_card/services/database.dart';
import 'package:flutter/material.dart';
import 'package:coffee_card/shared/constants.dart';
import 'package:flutter/services.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String? _currentName;
  String? _currentDish;
  int? _currentPrice;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserOne?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          UserData? userData = asyncSnapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your brew settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData!.name,
                  decoration: textInputDecoration,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (value) => setState(() {
                    _currentName = value;
                    return log(_currentName ?? 'no name');
                  }),
                ),
                SizedBox(height: 20.0),
                //dropdown
                TextFormField(
                  initialValue: userData.dish,
                  decoration: textInputDecoration,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a dish' : null,
                  onChanged: (value) => setState(() {
                    _currentDish = value;
                    return log(_currentDish ?? 'no dish');
                  }),
                ),
                //slider
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a price'
                      : null,
                  onChanged: (value) {
                    _currentPrice = int.tryParse(value);
                  },
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.pink[400]),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final navigator = Navigator.of(context);
                      await DatabaseService(uid: user?.uid).updateUserData(
                        _currentDish ?? userData.dish,
                        _currentName ?? userData.name,
                        _currentPrice ?? userData.price,
                      );

                      navigator.pop();
                    }
                  },
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
