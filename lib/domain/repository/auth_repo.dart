import 'package:demo/data/network/model/login.dart';
import 'package:demo/shared/result.dart';

abstract class AuthRepository {
  Future<Result<String>> login(LoginData loginData);
}
