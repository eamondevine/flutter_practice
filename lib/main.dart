import 'package:coffee_card/firebase_options.dart';
import 'package:coffee_card/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: Wrapper()));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandy Vuh Jay Jay'),
        backgroundColor: Colors.grey,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 100, color: Colors.red, child: Text('one')),
          Container(height: 200, color: Colors.green, child: Text('two')),
          Container(height: 300, color: Colors.blue, child: Text('three')),
        ],
      ),
    );
  }
}
