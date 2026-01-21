import 'package:demo/data/network/model/login.dart';
import 'package:demo/data/network/service/api_services.dart';
import 'package:demo/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final ApiServices _apiService;
  AuthRepositoryImp(this._apiService);

  @override
  Future<String> login(String userName, String password) async {
    try {
      final LoginData loginData = LoginData(
        userName: userName,
        password: password,
      );
      final token = await _apiService.login(loginData);
      return token;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
