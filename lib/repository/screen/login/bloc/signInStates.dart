import 'package:newsapp/domain/model/signInModel.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpStates.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInLoadedState extends SignInState {
  SignInModel signInModel;

  SignInLoadedState({required this.signInModel});
}

class SignInErrorState extends SignInState {
  String error;

  SignInErrorState({required this.error});
}
