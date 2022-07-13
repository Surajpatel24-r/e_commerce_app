import 'package:e_commerce_app/screens/explore_screen/explore_female.dart';
import 'package:e_commerce_app/screens/explore_screen/explore_man.dart';
import 'package:flutter/material.dart';

class CatagoryScreen extends StatefulWidget {
  final image, name;
  const CatagoryScreen({Key? key, this.image, this.name}) : super(key: key);

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95.0,
        width: 90.0,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 30,
                backgroundImage: NetworkImage(widget.image),
                child: ListTile(
                  onTap: () {
                    if (widget.name == "Women") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExploreFemaleScreen(),
                          ));
                    }
                    if (widget.name == "Men") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExploreManScreen(),
                          ));
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(widget.name),
              ),
            ],
          ),
        ));
  }
}
