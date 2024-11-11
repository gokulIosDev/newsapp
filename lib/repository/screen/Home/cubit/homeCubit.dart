import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/remote/apihelper.dart';
import 'package:newsapp/data/remote/urls.dart';
import 'package:newsapp/domain/model/homeModel.dart';
import 'package:newsapp/repository/screen/Home/cubit/homeState.dart';

class HomeCubit extends Cubit<HomeStates> {
  ApiHelper apiHelper;

  HomeCubit({required this.apiHelper}):super(HomeInitialStates());

  getData({required String query}) async {
    emit(HomeLoadingState());
    try {
      final responseData = await apiHelper.getApi(query: query);
      print(responseData);
      HomeModel homeModel = HomeModel.fromJson(responseData);
      emit(HomeLoadedState(homeModel: homeModel));
    } catch (er) {
      emit(HomeErrorState(error: er.toString()));
    }
  }
}
