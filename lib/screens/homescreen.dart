import 'package:e_commerce_app/screens/login/signup.dart';
import 'package:e_commerce_app/widgets/card.dart';
import 'package:e_commerce_app/models/circle_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataList.length,
                itemBuilder: (context, index) => CardScreen()),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.purple),
            child: TextField(),
          ),
        ],
      ),
    );
  }
}
