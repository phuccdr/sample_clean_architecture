import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/shared/result.dart';

abstract class AcademyRecordRepo {
  Future<Result<List<AcademyRecord>>> getAcademyRecords();
}
