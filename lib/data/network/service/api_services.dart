import 'package:demo/data/network/model/login.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  Future<String> login(LoginData loginData) async {
    Response<dynamic> response = await _dio.post(
      '/login',
      data: loginData.toJson(),
    );
    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Login failed:');
    }
  }
}
