import 'package:e_commerce_app/screens/homescreen.dart';
import 'package:e_commerce_app/widgets/size_list.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<String> categories = [
    'About',
    'Price',
    'summary',
    'Feedback',
    'About',
    'Price',
    'Summary',
    'Feedback'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          title: Center(
              child: Text(
            "Products",
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
                    builder: (context) => HomeScreen(),
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
        body: Container(
            child: Column(children: [
          Stack(children: [
            Container(
              color: Colors.blue,
              height: 260,
              width: 350,
              // color: Colors.blue,
              child: Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 110,
                        backgroundImage: NetworkImage(
                            "https://yt3.ggpht.com/ytc/AKedOLTYWSzYOUv2cQhYqkcv0oCCwmrXsjC-r8UDn28F2g=s900-c-k-c0x00ffffff-no-rj"),
                      ),
                    ],
                  )),
                ],
              )),
            ),
            Positioned(
                left: 10,
                bottom: 10,
                child: CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    radius: 29,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 28,
                      child: FavoriteButton(
                        valueChanged: (_isFavorite) {
                          print('Is Favorite $_isFavorite)');
                        },
                      ),
                    )))
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Milli Bobby\nBrown",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "Rs: 1200T",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [SizeListScreen()],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(categories[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == index
                                        ? Colors.blue
                                        : Colors.black)),
                            Container(
                                margin: EdgeInsets.only(top: 30 / 4),
                                height: 2,
                                width: 30,
                                color: selectedIndex == index
                                    ? Colors.blue
                                    : Colors.green)
                          ],
                        )),
                  ),
                )),
          ),
          // Expanded(
          //   child: Container(
          //     height: 60,
          //     child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         primary: Colors.purple,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(90),
          //         ),
          //       ),
          //       onPressed: () {},
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             'Add to Card',
          //             style: TextStyle(fontSize: 20),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(Icons.shopping_cart_outlined)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // )
        ])));
  }
}
