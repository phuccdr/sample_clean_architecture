import 'package:demo/data/network/model/login.dart';
import 'package:demo/domain/repository/auth_repo.dart';
import 'package:demo/shared/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Result<String>> execute(String userName, String password) {
    return _authRepository.login(
      LoginData(userName: userName, password: password),
    );
  }
}
