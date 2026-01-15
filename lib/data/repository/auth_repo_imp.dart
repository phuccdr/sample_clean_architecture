import 'package:demo/data/network/model/login.dart';
import 'package:demo/data/network/service/api_services.dart';
import 'package:demo/domain/repository/auth_repo.dart';
import 'package:demo/shared/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final ApiServices _apiService;

  AuthRepositoryImp(this._apiService);

  @override
  Future<Result<String>> login(LoginData loginData) async {
    try {
      final token = await _apiService.login(loginData);
      return Result.success(token);
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Đăng nhập thất bại';
      return Result.failed(message);
    } catch (e) {
      return Result.failed('Có lỗi xảy ra: ${e.toString()}');
    }
  }
}
