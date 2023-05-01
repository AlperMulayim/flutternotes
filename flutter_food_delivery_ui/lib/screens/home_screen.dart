import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          color: Colors.grey[50],
          onPressed: () => {},
        ),
        title: Text("Food Delivery"),
        actions: <Widget>[
          TextButton(
              child: Text(
            "Cart ( ${currentUser.cart.length} )",
            style: TextStyle(
              color: Colors.grey[50],
            ),
          )),
        ],
      ),
    );
  }
}
