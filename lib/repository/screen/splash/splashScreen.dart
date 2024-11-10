import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/repository/screen/onbording/onbordingScreen.dart';
import 'package:newsapp/repository/screen/splash/splashController/splashController.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SplashController.checkLogIn(context);
    /*
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBordingScreen()));
    });
    */

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.newspaper,
          color: Color(0XFF1F41BB),
          size: 60.h,
        ),
      ),
    );
  }
}
