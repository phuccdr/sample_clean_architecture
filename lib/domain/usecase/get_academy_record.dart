import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/domain/repository/academy_record_repo.dart';
import 'package:demo/shared/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAcademyRecordUseCase {
  final AcademyRecordRepo _academyRecordRepo;
  GetAcademyRecordUseCase(this._academyRecordRepo);
  Future<Result<List<AcademyRecord>>> execute() {
    return _academyRecordRepo.getAcademyRecords();
  }
}
