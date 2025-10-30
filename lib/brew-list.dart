import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot>(context);
    for (var d in brews.docs) {
      print(d.data);
    }
    return Container();
  }
}

// Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               color: Colors.brown[200],
//               padding: EdgeInsets.all(20),
//               child: StyledBodyText('How I like mah cafe...'),
//             ),
//             Container(
//               color: Colors.brown[100],
//               padding: EdgeInsets.all(20),
//               child: const CoffeePrefs(),
//             ),
//             Expanded(
//               child: Image.asset(
//                 'assets/img/coffee_bg.jpg',
//                 fit: BoxFit.fitWidth,
//                 alignment: Alignment.bottomCenter,
//               ),
//             ),
//           ],
//         ),
