import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/data/remote/apihelper.dart';
import 'package:newsapp/repository/screen/Home/cubit/homeCubit.dart';
import 'package:newsapp/repository/screen/login/bloc/signinBloc.dart';
import 'package:newsapp/repository/screen/onbording/onbordingScreen.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpBlock.dart';
import 'package:newsapp/repository/screen/splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SignUpBloc(apiHelper: ApiHelper())),
          BlocProvider(create: (_) => SignInBloc(apiHelper: ApiHelper())),
          BlocProvider(create: (_) => HomeCubit(apiHelper: ApiHelper())..getData()),
        ],
        child: MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Regular",
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF1F41BB)),
              useMaterial3: true,
            ),
            home: SplachScreen()),
      ),
    );
  }
}
