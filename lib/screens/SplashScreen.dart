import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/screens/HomeScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    Timer(Duration(seconds: 3), (){
      Navigator.popAndPushNamed(context, HomeScreen.id);
    }
    );
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Shimmer.fromColors(
            baseColor:Colors.white ,
            highlightColor: Colors.transparent,
            child: Container(
                height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sp.jpg'),
                    fit: BoxFit.cover
                  ),
                ),
                ),
                ),
      ),
    );
  }
}
