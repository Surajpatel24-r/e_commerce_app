import 'package:e_commerce_app/models/Networking/product_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiDataShowScreen extends StatefulWidget {
  const ApiDataShowScreen({Key? key}) : super(key: key);

  @override
  State<ApiDataShowScreen> createState() => _ApiDataShowScreenState();
}

class _ApiDataShowScreenState extends State<ApiDataShowScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('Fetch Data'),
            ),
            check ? Text('Data Received') : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  fetchData() async {
    check = await getData();
    setState(() {});
  }
}
