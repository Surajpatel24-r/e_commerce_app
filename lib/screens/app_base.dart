import 'package:e_commerce_app/screens/bottom_nav_bar/cartnavbar.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar/favoritenavbar.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar/homepagenavbar.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar/profilenavbar.dart';
import 'package:e_commerce_app/screens/collections.dart';
import 'package:e_commerce_app/screens/login/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBaseScreen extends StatefulWidget {
  const AppBaseScreen({Key? key}) : super(key: key);

  @override
  State<AppBaseScreen> createState() => _AppBaseScreenState();
}

class _AppBaseScreenState extends State<AppBaseScreen> {
  String _username = '';
  int index = 0;
  final screens = [
    HomePageNaveBarScreen(),
    FavoriteNavBarScreen(),
    CartNavBarScreen(),
    ProfileNavBarScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('asserts/login2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Color.fromARGB(255, 255, 224, 234),
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              height: 60,
              backgroundColor: Colors.deepOrange,
              // backgroundColor: Color.fromARGB(255, 255, 157, 190),
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_outline), label: 'Favorite'),
                NavigationDestination(
                    icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
                NavigationDestination(
                    icon: Icon(Icons.people_outline), label: 'Profile')
              ]),
        ),
        appBar: AppBar(
          // actions: [
          //   // IconButton(
          //   //   onPressed: () {
          //   //     Navigator.pop(context,
          //   //         MaterialPageRoute(builder: (context) => const MyLogin()));
          //   //   },
          //   //   icon: const Icon(Icons.logout),
          //   // )
          // ],
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          // backgroundColor: const Color.fromARGB(255, 255, 136, 176),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: const EdgeInsets.fromLTRB(60, 60, 60, 60),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 157, 190)),
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  '$_username',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),

                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const HomePage()));
                // }
              ),
              ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollectionsScreen(),
                        ));
                  }),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {}),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
