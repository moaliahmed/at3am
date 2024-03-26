import 'package:at3am/models/user_model.dart';

abstract class AppState {}

final class AppInitialState extends AppState {}

final class AppBottomNavBarChangeState extends AppState {}
final class FoodCategoryChangeState extends AppState {}
final class QuantitySliderChangeState extends AppState {}
final class PhotoLoadedState extends AppState {}
final class DeleteImageState extends AppState {}

// get user data from firebase

final class GetUserDataLoadingState extends AppState {}

final class GetUserDataSuccessState extends AppState {
  UserModel userModel;
  GetUserDataSuccessState({required this.userModel});
}

final class GetUserDataErrorState extends AppState {
  final String? error;
  GetUserDataErrorState({this.error});
}

// Create a post in firebase

final class CreateFoodLoadingState extends AppState {}

final class CreateFoodSuccessState extends AppState {}

final class CreateFoodErrorState extends AppState {
  final String? error;
  CreateFoodErrorState({this.error});
}
