import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/screen/login/bloc/signInEvents.dart';
import 'package:newsapp/repository/screen/login/bloc/signinBloc.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';

class SignInController {
  static signIn(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (email == "" || password == "") {
      return UiHelper.CustomSnackBar(
          text: "Enter Required Fields", context: context);
    } else {
      BlocProvider.of<SignInBloc>(context)
          .add(SignInUserEvents(email: email, password: password));
    }
  }
}
