import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteNavBarScreen extends StatefulWidget {
  const FavoriteNavBarScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteNavBarScreen> createState() => _FavoriteNavBarScreenState();
}

class _FavoriteNavBarScreenState extends State<FavoriteNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
    );
  }
}
