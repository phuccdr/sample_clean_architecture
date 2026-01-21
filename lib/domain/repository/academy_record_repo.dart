import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/domain/entities/register_data.dart';

abstract class AcademyRecordRepo {
  Future<List<AcademyRecord>> getAcademyRecords();
  Future<AcademyRecord> registerAcademyRecord(RegisterData registerData);
}
