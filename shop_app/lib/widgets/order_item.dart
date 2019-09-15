import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/providers/orders.dart' as provider;

class OrderItem extends StatefulWidget {
  final provider.OrderItem order;

  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less,),
            ),
          ),
          _expanded ? (
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180.0),
              padding: EdgeInsets.all(10),
              child: ListView(
                children: widget.order.products.map((product) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(product.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('${product.quantity}x \$${product.price}', style: TextStyle(fontSize: 18, color: Colors.grey),)
                  ],),
                ).toList(),
              ),
            )
          ) : Container(),
        ],
      ),
    );
  }
}
