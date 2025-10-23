import 'package:coffee_card/firebase_options.dart';
import 'package:coffee_card/models/user.dart';
import 'package:coffee_card/services/auth.dart';
import 'package:coffee_card/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Load .env file BEFORE Firebase
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    StreamProvider<UserOne?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(home: Wrapper()),
    ),
  );
}
