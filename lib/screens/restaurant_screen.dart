import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 220,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(widget.restaurant.imageUrl),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                      ),
                      iconSize: 35,
                      color: Theme.of(context).primaryColor,
                      onPressed: () => {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
