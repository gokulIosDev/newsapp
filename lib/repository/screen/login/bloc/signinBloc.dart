import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/remote/apihelper.dart';
import 'package:newsapp/data/remote/urls.dart';
import 'package:newsapp/domain/constants/appprefs.dart';
import 'package:newsapp/domain/model/signInModel.dart';
import 'package:newsapp/repository/screen/login/bloc/signInEvents.dart';
import 'package:newsapp/repository/screen/login/bloc/signInStates.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  ApiHelper apiHelper;

  SignInBloc({required this.apiHelper}) : super(SignInInitialState()) {
    on<SignInUserEvents>((event, emit) async {
      emit(SignInLoadingState());
      try {
        final responseData =
            await apiHelper.postapi(url: BaseUrls.signIn, bodyparams: {
          "email": event.email,
          "password": event.password,
        });
        await AppPrefs().setbool();
        String token = responseData['token'];
        await AppPrefs().setToken(token);
        log(token);
        final signInModel = SignInModel.fromJson(responseData);
        emit(SignInLoadedState(signInModel: signInModel));
      } catch (ex) {
        emit(SignInErrorState(error: ex.toString()));
      }
    });
  }
}
