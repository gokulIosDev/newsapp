import 'package:newsapp/data/remote/apihelper.dart';
import 'package:newsapp/data/remote/urls.dart';
import 'package:newsapp/domain/model/signUpModel.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpEvents.dart';
import 'package:newsapp/repository/screen/signUp/bloc/signUpStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  ApiHelper apiHelper;

  SignUpBloc({required this.apiHelper}) : super(SignUpInitialStates()) {
    on<SignUpUserEvents>((event, emit) async {
      emit(SignUpLoadingStates());
      try {
        final responseData = await apiHelper.postapi(
            url: BaseUrls.signUp,
            bodyparams: {
              "email": event.email,
              "password": event.password,
              "username": event.userName
            });
        final signUpModel = SignUpModel.fromJson(responseData);
        emit(SignUpLoadedState(signUpModel: signUpModel));
      } catch (ex) {
        emit(SignUpErrorState(error: ex.toString()));
      }
    });
  }
}
