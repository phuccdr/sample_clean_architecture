import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/data/network/service/api_services.dart';
import 'package:demo/domain/entities/register_data.dart';
import 'package:demo/domain/repository/academy_record_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AcademyRecordRepo)
class AcademyRecordRepoImp implements AcademyRecordRepo {
  final ApiServices _apiServices;
  AcademyRecordRepoImp(this._apiServices);
  @override
  Future<List<AcademyRecord>> getAcademyRecords() async {
    try {
      final List<AcademyRecord> academyRecords = await _apiServices
          .getAcademyRecord();
      return academyRecords;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AcademyRecord> registerAcademyRecord(RegisterData registerData) async {
    try {
      final AcademyRecord academyRecord = await _apiServices
          .registerAcademyRecord(registerData);
      return academyRecord;
    } catch (e) {
      throw Exception(e);
    }
  }
}
