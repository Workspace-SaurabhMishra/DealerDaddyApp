import 'package:cardup/color_pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../modules/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required LiquidController liquidController})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home Page',
    ),
    Text(
      'Profile Page',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CarouselSlider(
            items: [
              Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                child: Image.asset(
                  "assets/images/flipkartBanner.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 100,
                margin: const EdgeInsets.all(20),
                child: Image.asset(
                  "assets/images/amazon-banner.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                child: Image.asset(
                  "assets/images/nykaa-banner.jpeg",
                  fit: BoxFit.cover,
                ),
              )
            ],
            options: CarouselOptions(
              initialPage: 1,
              enableInfiniteScroll: true,
              enlargeCenterPage: false,
              aspectRatio: 21 / 9,
              autoPlay: true,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                    ),
                    child: Image.asset(
                      "assets/images/flipkart_logo.png",
                    ),
                  ),
                  Container(
                    width: getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                    ),
                    child: Image.asset(
                      "assets/images/flipkart_logo.png",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                    ),
                    child: Image.asset(
                      "assets/images/flipkart_logo.png",
                    ),
                  ),
                  Container(
                    width: getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                    ),
                    child: Image.asset(
                      "assets/images/flipkart_logo.png",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                    ),
                    child: Image.asset(
                      "assets/images/flipkart_logo.png",
                    ),
                  ),
                  Container(
                    width: getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                    ),
                    child: Image.asset(
                      "assets/images/flipkart_logo.png",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
            height: 50,
            child: Container(
              color: bottomSheetColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
