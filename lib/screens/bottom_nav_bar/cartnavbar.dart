import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartNavBarScreen extends StatefulWidget {
  const CartNavBarScreen({Key? key}) : super(key: key);

  @override
  State<CartNavBarScreen> createState() => _CartNavBarScreenState();
}

class _CartNavBarScreenState extends State<CartNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
    );
  }
}
