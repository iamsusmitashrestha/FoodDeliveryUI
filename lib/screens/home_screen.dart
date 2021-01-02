import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: restaurant))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.grey[200])),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    image: AssetImage(restaurant.imageUrl),
                  ),
                ),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingStars(restaurant.rating),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.address,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "0.2 miles away",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30,
          onPressed: () {},
        ),
        title: Text("Food Delivery"),
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: "Search Food or Restaurants",
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30,
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Nearby Restaurants",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildRestaurants(),
            ],
          )
        ],
      ),
    );
  }
}
