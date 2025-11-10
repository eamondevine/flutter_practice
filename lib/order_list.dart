import 'package:coffee_card/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_card/order_tile.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Order>>(context);
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderTile(order: orders[index]);
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
