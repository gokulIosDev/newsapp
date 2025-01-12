import 'package:flutter/material.dart';

class UiHelper {
  static CustomInage({required String url}) {
    return Image.asset("assets/images/$url");
  }

  static CustomTExt(
      {required String text,
        Color? color,
        String? fontFamily,
        FontWeight? fontWeight,
        double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Color(0XFF000000),
          fontFamily: fontFamily ?? "Regular",
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize),
    );
  }

  static CustomButton(
      {required VoidCallback callBack,
        Color? foreGround,
        Color? backGround,
        double? height,
        double? width,
        required String text}) {
    return SizedBox(
      height: height ?? 60,
      width: width ?? 360,
      child: ElevatedButton(
          onPressed: callBack,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: backGround ?? Color(0XFF1F41BB)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: "Regular",
                color: foreGround ?? Color(0XFFFFFFFF)),
          )),
    );
  }

  static CustomTextField({
    required TextInputType keyBoardStyle,
    required TextEditingController controller,
    required String text,
    required bool isHide,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0XFFF1F4FF),
          border: Border.all(color: Colors.grey),
        ),
        child: TextField(
          controller: controller,
          obscureText: isHide,
          keyboardType: keyBoardStyle,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjust padding here
            hintText: text,
            hintStyle: TextStyle(
              color: Color(0XFF626262),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }


  static CustomSnackBar({required String text, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: const Color(0XFF1F41BB),
    ));
  }

  static CustomSearchTextField(
      {required TextEditingController controller,
        required String text,
        required VoidCallback callback}) {
    return SizedBox(
      height: 35,
      width: 280,
      child: TextField(
        textAlign: TextAlign.justify,
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            hintStyle:  TextStyle(color: Color(0XFF818181),fontSize: 12),
            suffixIcon: IconButton(
                onPressed: () {
                  callback();
                },
                icon: Image.asset("assets/images/scarch.png")),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
