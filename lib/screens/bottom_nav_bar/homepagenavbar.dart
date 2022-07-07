import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../products.dart';

class HomePageNaveBarScreen extends StatefulWidget {
  const HomePageNaveBarScreen({Key? key}) : super(key: key);

  @override
  State<HomePageNaveBarScreen> createState() => _HomePageNaveBarScreenState();
}

class _HomePageNaveBarScreenState extends State<HomePageNaveBarScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Product').snapshots();
  // @override
  // void initState() async {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Image(image: NetworkImage(data['product_image'])),
              title: Text(data['product_name']),
              subtitle: Text(data['product_description']),
              trailing: Text(data['product_price']),
            );
          }).toList(),
        );
      },
    );
  }
}
