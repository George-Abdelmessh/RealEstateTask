import 'package:real_estate_task/features/home/data/model/user/user_model.dart';

abstract class UserStates {}

class UserInitialState extends UserStates {}

class LoadingUserDataState extends UserStates {}

class SuccessUserDataState extends UserStates {
  final List<UserModel> result;

  SuccessUserDataState(this.result);
}

class ErrorUserDataState extends UserStates {
  final String error;

  ErrorUserDataState(this.error);
}
