import 'package:flutter/material.dart';
import 'package:coffee_card/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Update your brew settings.', style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
            onChanged: (value) => setState(() {
              _currentName = value;
            }),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (value) => setState(() {
              _currentSugars = value;
            }),
          ),
          //slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (value) => {
              setState(() {
                _currentStrength = value.round();
              }),
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.pink[400]),
            ),
            onPressed: () async {},
            child: Text('Update', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
