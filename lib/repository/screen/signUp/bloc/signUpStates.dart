import 'package:newsapp/domain/model/signUpModel.dart';

abstract class SignUpStates {}

class SignUpInitialStates extends SignUpStates {}

class SignUpLoadingStates extends SignUpStates {}

class SignUpLoadedState extends SignUpStates {
  SignUpModel signUpModel;

  SignUpLoadedState({required this.signUpModel});
}

class SignUpErrorState extends SignUpStates {
  String error;

  SignUpErrorState({required this.error});
}
