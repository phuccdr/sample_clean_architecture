import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/data/network/service/api_services.dart';
import 'package:demo/domain/repository/academy_record_repo.dart';
import 'package:demo/shared/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AcademyRecordRepo)
class AcademyRecordRepoImp implements AcademyRecordRepo {
  final ApiServices _apiServices;
  AcademyRecordRepoImp(this._apiServices);
  @override
  Future<Result<List<AcademyRecord>>> getAcademyRecords() async {
    try {
      final List<AcademyRecord> academyRecords = await _apiServices
          .getAcademyRecord();
      return Result.success(academyRecords);
    } catch (e) {
      return Result.failed('Có lỗi xảy ra: ${e.toString()}');
    }
  }
}
