import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/data/network/service/api_services.dart';
import 'package:demo/domain/entities/register_data.dart';
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

  @override
  Future<Result<AcademyRecord>> registerAcademyRecord(
    RegisterData registerData,
  ) async {
    try {
      final AcademyRecord academyRecord = await _apiServices
          .registerAcademyRecord(registerData);
      return Result.success(academyRecord);
    } catch (e) {
      return Result.failed('error: $e');
    }
  }
}
