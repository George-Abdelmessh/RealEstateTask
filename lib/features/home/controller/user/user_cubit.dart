import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/features/home/controller/user/user_states.dart';
import 'package:real_estate_task/features/home/data/model/user/user_model.dart';
import 'package:real_estate_task/features/home/data/user_data.dart';

class UserDataCubit extends Cubit<UserStates> {
  UserDataCubit() : super(UserInitialState());

  static UserDataCubit get(BuildContext context) => BlocProvider.of(context);

  List<UserModel> userData = [];

  Future<void> getUserData(BaseUserData userDataSource) async{
    emit(LoadingUserDataState());
    try {
      userData = await userDataSource.getUserDate();
      emit(SuccessUserDataState(userData));
    } catch (e) {
      emit(ErrorUserDataState(e.toString()));
    }
  }

}