import 'package:e_commerce_app/screens/products.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  final image, name, price;

  const CardScreen({Key? key, this.image, this.name, this.price})
      : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsScreen(),
            ));
      },
      child: Container(
        height: 335,
        width: 240,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 210,
                    width: 210,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(image: NetworkImage(
                            // "https://yt3.ggpht.com/ytc/AKedOLTYWSzYOUv2cQhYqkcv0oCCwmrXsjC-r8UDn28F2g=s900-c-k-c0x00ffffff-no-rj"
                            widget.image))),
                  ),
                  Positioned(
                      right: 7,
                      top: 7,
                      child: FavoriteButton(
                        valueChanged: (_isFavorite) {
                          print('Is Favorite $_isFavorite)');
                        },
                      )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Rs: ${widget.price}\n${widget.name}",
                    style: TextStyle(fontSize: 16),
                  ),
                  FloatingActionButton(
                    // heroTag: 'f',
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
