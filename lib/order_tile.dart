import 'package:flutter/material.dart';
import 'package:coffee_card/models/order.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat(
      '#,###',
    ).format(order.price); // adds commas
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(radius: 25.0, backgroundColor: Colors.blue),
          title: Text(order.name),
          subtitle: Column(
            children: [
              Text('Ordered: ${order.dish}'),
              const SizedBox(height: 4.0),
              Text('Price: $formattedPrice'),
            ],
          ),
        ),
      ),
    );
  }
}
