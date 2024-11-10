import 'package:newsapp/domain/model/homeModel.dart';

abstract class HomeStates{}
class HomeInitialStates extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeLoadedState extends HomeStates{
  HomeModel homeModel;
  HomeLoadedState({required this.homeModel});
}
class HomeErrorState extends HomeStates{
  String error;
  HomeErrorState({required this.error});
}