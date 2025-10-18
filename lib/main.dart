import 'package:coffee_card/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffee_card/home.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: Home()));
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 200, color: Colors.red, child: const Text('one')),
          Container(width: 300, color: Colors.orange, child: const Text('two')),
          Container(
            width: 400,
            color: Colors.yellow,
            child: const Text('three'),
          ),
        ],
      ),
    );
  }
}
