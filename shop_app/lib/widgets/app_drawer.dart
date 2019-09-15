import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pay'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/orders');
            },
          )
        ],
      ),
    );
  }
}
