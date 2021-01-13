import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_engine/Frypan/Screens/mainScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final controller = PageController(
    viewportFraction: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Align(
          child: GestureDetector(
            child: new Text("Skip"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            ),
          ),
          alignment: Alignment(1.05, 0.5),
        ),
        actions: <Widget>[
          Transform.rotate(
            angle: 7 * pi / 4,
            child: IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.redo,
                color: Color(0xff0433fe),
                size: 30,
              ),
              onPressed: () {
                // do something
              },
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: PageView(
                  allowImplicitScrolling: true,
                  controller: controller,
                  children: List.generate(
                    3,
                    (index) => Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Image.asset(
                            "assets/images/carousel/${3 - index}.png"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 2,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xff0433fe),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: new RawMaterialButton(
                  shape: new CircleBorder(),
                  elevation: 0.0,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  ),
                ),
              ),
              Container(
                child: Image.asset("assets/images/carousel/car_backg.png"),
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
