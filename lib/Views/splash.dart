import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: 50,
                      //  backgroundImage: Image.asset(assets/news.png"),
                      //   // child: Icon(
                      //   //   Icons.note,
                      //   //   color: Colors.greenAccent,
                      //   //   size: 50,
                      //   // )
                      // ),
                      //   backgroundImage: CachedNetworkImage(

                      //       "https://www.google.com/search?sxsrf=ALeKk01V0V-z3zGiRY78k28BeovaRrUTLw:1604344736228&source=univ&tbm=isch&q=news+app+logo&sa=X&ved=2ahUKEwj7g-bwyeTsAhUNxzgGHauHBCQQ7Al6BAgDED8&biw=1492&bih=768#imgrc=wqjdT7Zaw5lrJM"),
                      //   // child: CachedNetworkImage(
                      //   //   imageUrl:
                      //   //       "https://www.google.com/search?sxsrf=ALeKk01V0V-z3zGiRY78k28BeovaRrUTLw:1604344736228&source=univ&tbm=isch&q=news+app+logo&sa=X&ved=2ahUKEwj7g-bwyeTsAhUNxzgGHauHBCQQ7Al6BAgDED8&biw=1492&bih=768#imgrc=wqjdT7Zaw5lrJM",
                      //   //   //        width: 120,
                      //   //         height: 60,
                      //   // fit: BoxFit.cover,,
                      // ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(6),
                      //   child: Image.asset(
                      //     "assets/logo.png",
                      //     height: 100,
                      //     width: 50,

                      //   ),

                      // ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red,
                        ),
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: AssetImage(
                              "assets/logo1.png",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),

                      Text(
                        "India News",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      "India Stay Updated...!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
