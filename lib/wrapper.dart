import 'package:coffee_card/authentication/authenticate.dart';
import 'package:coffee_card/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // return either Home or Auth
    return Home();
  }
}
