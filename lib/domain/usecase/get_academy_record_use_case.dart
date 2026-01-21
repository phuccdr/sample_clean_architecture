import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/domain/repository/academy_record_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAcademyRecordUseCase {
  final AcademyRecordRepo _academyRecordRepo;
  GetAcademyRecordUseCase(this._academyRecordRepo);
  TaskEither<String, List<AcademyRecord>> execute() {
    return TaskEither.tryCatch(() async {
      final reponse = await _academyRecordRepo.getAcademyRecords();
      return reponse;
    }, (error, stackTrace) => error.toString());
  }
}
