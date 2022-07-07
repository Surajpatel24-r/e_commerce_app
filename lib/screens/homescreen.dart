import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screens/login/signup.dart';

import 'package:e_commerce_app/models/circle_model.dart';
import 'package:e_commerce_app/widgets/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Product').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Center(
            child: Text(
          "Collections",
          style: TextStyle(color: Colors.black),
        )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Collections",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 33,
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 115.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataList.length,
              itemBuilder: (context, index) => Container(
                  height: 100.0,
                  width: 95.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundImage: NetworkImage(dataList[index].image),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(dataList[index].name),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New In",
                style: TextStyle(fontSize: 30),
              ),
              TextButton(onPressed: () {}, child: Text("See All"))
            ],
          ),
          SizedBox(
              height: 330,
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return CardScreen(
                        image: data['product_image'],
                        name: data['product_name'],
                        price: data['product_price'],
                      );
                      // ListTile(
                      //   leading: Image(image: NetworkImage(data['product_image'])),
                      //   title: Text(data['product_name']),
                      //   subtitle: Text(data['product_description']),
                      //   trailing: Text(data['product_price']),
                      // );
                    }).toList(),
                  );
                },
              )
              // ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: dataList.length,
              //     itemBuilder: (context, index) => CardScreen()),
              ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        maxRadius: 20, child: Icon(Icons.search_outlined)),
                    Text(
                      'Find Somthing',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.filter_list)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
