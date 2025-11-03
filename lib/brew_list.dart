import 'package:coffee_card/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_card/brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
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
