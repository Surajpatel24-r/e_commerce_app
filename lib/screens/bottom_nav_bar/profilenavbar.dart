import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileNavBarScreen extends StatefulWidget {
  const ProfileNavBarScreen({Key? key}) : super(key: key);

  @override
  State<ProfileNavBarScreen> createState() => _ProfileNavBarScreenState();
}

class _ProfileNavBarScreenState extends State<ProfileNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}
