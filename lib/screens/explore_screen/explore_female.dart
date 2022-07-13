import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreFemaleScreen extends StatefulWidget {
  const ExploreFemaleScreen({Key? key}) : super(key: key);

  @override
  State<ExploreFemaleScreen> createState() => _ExploreFemaleScreenState();
}

class _ExploreFemaleScreenState extends State<ExploreFemaleScreen> {
  final Stream<QuerySnapshot> _allCategoryStream = FirebaseFirestore.instance
      .collection('Catagories/B5oIkrQ7kY5oArqtQT1x/AllProductsCategories')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: StreamBuilder<QuerySnapshot>(
          stream: _allCategoryStream,
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
                  leading: Image(
                      image: NetworkImage(data['product_category_image'])),
                  title: Text(data['product_category_name']),
                  subtitle: Text(data['product_category_description']),
                  trailing: Text(data['product_category_price']),
                );
              }).toList(),
            );
          },
        )),
      ),
    );
  }
}
