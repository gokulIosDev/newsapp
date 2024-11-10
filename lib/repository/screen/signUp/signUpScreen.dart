import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/repository/screen/login/logInScreen.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpBlock.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpStates.dart';
import 'package:newsapp/repository/screen/signUp/controllers/signUpController.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';

class SignUpScren extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomTExt(
                  text: "Create Account",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF1F41BB)),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomTExt(
                text: "Create an account so you can explore all the",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              UiHelper.CustomTExt(
                text: "existing jobs",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomTextField(
                  keyBoardStyle: TextInputType.text,
                  controller: emailController,
                  text: "Email",
                  isHide: false),
              SizedBox(
                height: 20,
              ),
              UiHelper.CustomTextField(
                  keyBoardStyle: TextInputType.text,
                  controller: passwordController,
                  text: "Password",
                  isHide: true),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<SignUpBloc, SignUpStates>(
                listener: (context, state) {
                  if (state is SignUpLoadedState) {
                     UiHelper.CustomSnackBar(
                        text: state.signUpModel.message.toString(),
                        context: context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  } else if (state is SignUpErrorState) {
                     UiHelper.CustomSnackBar(
                        text: state.error.toString(), context: context);
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoadingStates) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return UiHelper.CustomTextField(
                      keyBoardStyle: TextInputType.text,
                      controller: userNameController,
                      text: "User Name",
                      isHide: false);
                },
              ),
              SizedBox(
                height: 20,
              ),
              UiHelper.CustomButton(
                callBack: () {
                  SignUpController.signUp(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                      userName: userNameController.text.toString(),
                      context: context);
                },
                text: "Sign Up",
                height: 50,
                width: 365,
                backGround: Color(0XFF1F41BB),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  },
                  child: Text(
                    "Already have an account",
                    style: TextStyle(color: Color(0XFF494949)),
                  )),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScren()));
                },
                child: Text("Or create with",
                    style: TextStyle(color: Color(0XFF1F41BB))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(color: Color(0XFFECECEC)),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.facebook)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
