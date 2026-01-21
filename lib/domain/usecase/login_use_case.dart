import 'package:demo/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  TaskEither<String, String> execute(String userName, String password) {
    return TaskEither.tryCatch(() async {
      final response = await _authRepository.login(userName, password);
      return response;
    }, (error, stackTrace) => error.toString());
  }
}
