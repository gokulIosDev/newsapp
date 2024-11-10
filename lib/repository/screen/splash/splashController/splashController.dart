import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/domain/constants/appprefs.dart';
import 'package:newsapp/repository/screen/Bottom/bottomNav.dart';
import 'package:newsapp/repository/screen/Home/homeScreen.dart';
import 'package:newsapp/repository/screen/onbording/onbordingScreen.dart';

class SplashController {
  static checkLogIn(BuildContext context) async {
    bool value = await AppPrefs().getbool();
    if (value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNAvigation()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBordingScreen()));
    }
  }
}
