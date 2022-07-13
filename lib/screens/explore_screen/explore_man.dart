import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExploreManScreen extends StatefulWidget {
  const ExploreManScreen({Key? key}) : super(key: key);

  @override
  State<ExploreManScreen> createState() => _ExploreManScreenState();
}

class _ExploreManScreenState extends State<ExploreManScreen> {
  final Stream<QuerySnapshot> _allCategoryStream = FirebaseFirestore.instance
      .collection('Catagories/N6gaCXXFqTshpHn4xgx1/AllProductsCategories')
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
