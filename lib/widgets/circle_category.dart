import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleCategoryScreen extends StatefulWidget {
  const CircleCategoryScreen({Key? key}) : super(key: key);

  @override
  State<CircleCategoryScreen> createState() => _CircleCategoryScreenState();
}

class _CircleCategoryScreenState extends State<CircleCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 60,
        // width: 60,
        // child: Center(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       CircleAvatar(maxRadius: 38,
        //       backgroundImage: NetworkImage(dataList[index].image),),
        //       Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Text("Suraj"),
        //       ),
        //     ],
        //   ),
        );
  }
}
