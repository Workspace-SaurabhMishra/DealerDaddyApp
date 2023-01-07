import 'package:cardup/color_pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../modules/utilities.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required LiquidController liquidController})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          padding: const EdgeInsets.only(top:15),
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
          ], options: CarouselOptions(
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
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                      ),
                      child: Image.asset(
                        "assets/images/flipkartmng.jpeg",
                      ),
                    ),
                    Container(
                      width: getWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                      ),
                      child: Image.asset(
                        "assets/images/flipkartmng.jpeg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                      ),
                      child: Image.asset(
                        "assets/images/flipkartmng.jpeg",
                      ),
                    ),
                    Container(
                      width: getWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                      ),
                      child: Image.asset(
                        "assets/images/flipkartmng.jpeg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                      ),
                      child: Image.asset(
                        "assets/images/flipkartmng.jpeg",
                      ),
                    ),
                    Container(
                      width: getWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30), //<-- SEE HERE
                      ),
                      child: Image.asset(
                        "assets/images/flipkartmng.jpeg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
            backgroundColor: bottomSheetColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 50,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin, color: Colors.white, size: 50),
                label: '',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            elevation: 4),
      ),
    );
  }
}
