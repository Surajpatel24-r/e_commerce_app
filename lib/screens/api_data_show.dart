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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: Text('Fetch Data'),
              ),
              check
                  ? FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ProductApi> dData =
                              snapshot.data as List<ProductApi>;
                          return Column(
                            children: dData
                                .map((e) => Card(
                                      child: Column(
                                        children: [
                                          Text(e.title),
                                          Image.network(e.images[0]),
                                          Text(e.title),
                                          Image.network(e.images[1]),
                                          Text(e.title),
                                          Image.network(e.images[2]),
                                          Text(e.title),
                                          Image.network(e.images[3]),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
                  : CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  fetchData() async {
    // check =
    List cData = await getData();
    if (cData.length > 0) {
      check = true;
    } else {}
    setState(() {});
  }
}
