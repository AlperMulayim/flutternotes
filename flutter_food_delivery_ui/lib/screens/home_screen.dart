import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

import 'package:flutter_food_delivery_ui/widgets/recent_order.dart';

import '../widgets/rating_stars.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  buildRestaurants() {
    List<Widget> restaurantWidgets = [];

    restaurants.forEach((Restaurant restaurant) => {
          restaurantWidgets.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.grey[200])),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: AssetImage(restaurant.imageUrl),
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(restaurant.name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                    SizedBox(height: 4.0,),
                    RatingStars(restaurant.rating),
                    SizedBox(height: 4.0,),
                    Text(restaurant.address,style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),),
                    SizedBox(height: 4.0,),
                    Text("2 km away",style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600))
                  ],
                ),
              )
            ]),
          ))
        });

    return Column(children: restaurantWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          color: Colors.grey[50],
          onPressed: () => {},
        ),
        title: Text("Food Delivery"),
        actions: <Widget>[
          TextButton(
              child: Text(
            "Cart ( ${currentUser.cart.length} )",
            style: TextStyle(
              color: Colors.grey[50],
            ),
          )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Restaurant",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor))),
            ),
          ),
          RecentOrders(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                )
              ],
            ),
          ),
          buildRestaurants()
        ],
      ),
    );
  }
}
