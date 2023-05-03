import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, physics: PageScrollPhysics(), children: [
        Stack(
          children: [
            Hero(
              tag: widget.restaurant.imageUrl,
              child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.restaurant.imageUrl)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (() => Navigator.pop(context)),
                      iconSize: 30.0,
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios_new)),
                  IconButton(
                      onPressed: (() {}),
                      iconSize: 30.0,
                      color: Colors.red,
                      icon: Icon(Icons.favorite))
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.restaurant.name,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  Text("2 miles away")
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingStars(widget.restaurant.rating),
                  SizedBox(height: 10.0),
                  Text(
                    widget.restaurant.address,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.0,
                    child: TextButton(
                        onPressed: (() {}),
                        child: Text(
                          "Reviews",
                          style: TextStyle(color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  Container(
                    width: 100.0,
                    child: TextButton(
                        onPressed: (() {}),
                        child: Text(
                          "Contact",
                          style: TextStyle(color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(
            "Menu",
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          child: GridView.count(
              shrinkWrap: true,
              physics: PageScrollPhysics(),
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return buildMenuItem(food);
              })),
        ),
      ]),
    );
  }

  Widget buildMenuItem(Food food) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: 160.0,
        height: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(food.imageUrl)),
        ),
      ),
      Container(
          width: 160.0,
          height: 160.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ]))),
      Positioned(
        top: 80.0,
        child: Column(
          children: [
            Text(
              food.name,
              style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text('\$${food.price}',
                style: TextStyle(fontSize: 16.0, color: Colors.white))
          ],
        ),
      ),
      Positioned(
          top: 140.0,
          left: 140.0,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: (() {}),
            ),
          ))
    ]);
  }
}
