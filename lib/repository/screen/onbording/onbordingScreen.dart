import 'package:flutter/material.dart';
import 'package:newsapp/repository/screen/login/logInScreen.dart';
import 'package:newsapp/repository/screen/signUp/signUpScreen.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomInage(url: "welcome image.png"),
          SizedBox(
            height: 10.h,
          ),
          UiHelper.CustomTExt(
              text: "Discover Your",
              fontSize: 35.sp,
              color: Color(0XFF1F41BB),
              fontWeight: FontWeight.bold),
          UiHelper.CustomTExt(
              text: "Dream Job Here",
              fontSize: 35.sp,
              color: Color(0XFF1F41BB),
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10.h,
          ),
          UiHelper.CustomTExt(
            text: "Explore all the existing job roles based on your",
            fontSize: 14.sp,
          ),
          UiHelper.CustomTExt(
            text: "interest and study major",
            fontSize: 14.sp,
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomButton(

                callBack: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInScreen()));
                },
                text: "Get Start",
                height: 50,
                width: 320,
              ),

            ],
          )
        ],
      ),
    );
  }
}
