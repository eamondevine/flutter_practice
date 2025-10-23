import 'dart:developer';

import 'package:coffee_card/authentication/authenticate.dart';
import 'package:coffee_card/home.dart';
import 'package:coffee_card/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserOne?>(context);
    // return either Home or Auth
    if (user == null) {
      return Authenticate();
    } else {
      log(user.uid);
      return Home();
    }
  }
}
