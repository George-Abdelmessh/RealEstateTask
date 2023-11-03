import 'package:dio/dio.dart';
import 'package:real_estate_task/features/home/data/model/user/user_model.dart';

abstract class BaseUserData {
  Future<List<UserModel>> getUserDate();
}

class UserData implements BaseUserData {
  @override
  Future<List<UserModel>> getUserDate() async {
    final Response res =
        await Dio().get('https://jsonplaceholder.typicode.com/users');
    if (res.statusCode == 200) {
      return List<UserModel>.from((res.data as List).map(
        (e) => UserModel.fromJson(e),
      ));
    } else {
      throw Exception('There is a problem with the connection!');
    }
  }
}
