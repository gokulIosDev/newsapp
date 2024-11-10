import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/repository/screen/Bottom/bottomNav.dart';
import 'package:newsapp/repository/screen/Home/homeScreen.dart';
import 'package:newsapp/repository/screen/login/bloc/signInStates.dart';
import 'package:newsapp/repository/screen/login/bloc/signinBloc.dart';
import 'package:newsapp/repository/screen/login/controller/signInController.dart';
import 'package:newsapp/repository/screen/signUp/signUpScreen.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';

class LogInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  text: "Login Here",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF1F41BB)),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomTExt(
                text: "Wellcome back you've",
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              UiHelper.CustomTExt(
                text: "been missed!",
                fontSize: 20.sp,
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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Your Password?",
                          style: TextStyle(
                              color: Color(0XFF1F41BB),
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
              BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  if (state is SignInLoadedState) {
                    UiHelper.CustomSnackBar(
                        text: state.signInModel.message.toString(),
                        context: context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => BottomNAvigation()));
                  } else if (state is SignInErrorState) {
                    UiHelper.CustomSnackBar(
                        text: state.error.toString(), context: context);
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return CircularProgressIndicator();
                  }
                  return Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: UiHelper.CustomButton(
                        height: 50,
                        callBack: () {
                          SignInController.signIn(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                              context: context);
                        },
                        text: "Sign In"),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpScren()));
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(color: Color(0XFF494949)),
                  )),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
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
