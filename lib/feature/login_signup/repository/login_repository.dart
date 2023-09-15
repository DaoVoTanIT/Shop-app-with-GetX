import 'package:dio/dio.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class LoginRepository {
  Dio client;

  LoginRepository({required this.client});

  Future<void> authenticateUser(String userName, String password) async {
    final data = {'username': userName, 'password': password};
    final response = await client.post('/auth/login', data: data);
    await setValueString(
        SharedPrefKey.tokenUser, response.data['token'].toString());
  }

  Future<void> createAccount(String userName, String password) async {
    final data = {
      'userName': userName,
      'password': password,
      'confirmPassword': password
    };
    try {
      await client.post('/api/auth/Register', data: data);
    } on DioError catch (ex) {
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }
}
