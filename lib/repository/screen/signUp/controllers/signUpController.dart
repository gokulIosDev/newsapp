import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpBlock.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpEvents.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';

class SignUpController {
  static signUp(
      {required String email,
      required String password,
      required String userName,
      required BuildContext context}) {
    if (email == "" || password == "" || userName == "") {
      return UiHelper.CustomSnackBar(
          text: "Enter Required Fields", context: context);
    } else {
      BlocProvider.of<SignUpBloc>(context).add(SignUpUserEvents(
          email: email, password: password, userName: userName));
    }
  }
}
