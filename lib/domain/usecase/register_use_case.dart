import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/domain/entities/register_data.dart';
import 'package:demo/domain/repository/academy_record_repo.dart';
import 'package:demo/shared/result.dart';

class RegisterUseCase {
  final AcademyRecordRepo _academyRecordRepo;
  RegisterUseCase(this._academyRecordRepo);

  Future<Result<AcademyRecord>> execute(RegisterData registerData) {
    return _academyRecordRepo.registerAcademyRecord(registerData);
  }
}
