import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/domain/entities/register_data.dart';
import 'package:demo/domain/repository/academy_record_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AcademyRecordRepo _academyRecordRepo;
  RegisterUseCase(this._academyRecordRepo);

  TaskEither<String, AcademyRecord> execute(RegisterData registerData) {
    return TaskEither.tryCatch(() async {
      final response = await _academyRecordRepo.registerAcademyRecord(
        registerData,
      );
      return response;
    }, (error, stackTrace) => error.toString());
  }
}
