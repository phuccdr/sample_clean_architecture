import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/data/network/model/login.dart';
import 'package:demo/domain/entities/register_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  Future<String> login(LoginData loginData) async {
    try {
      final response = await _dio.post('/login', data: loginData.toJson());

      final token = response.data['token'] as String;
      return token;
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Login failed';
      throw Exception(message);
    } catch (e) {
      throw Exception('Unexpected error occurred');
    }
  }

  Future<List<AcademyRecord>> getAcademyRecord() async {
    try {
      final reponse = await _dio.get('/academyrecord');
      final List<AcademyRecord> academyRecords = (reponse.data as List)
          .map((e) => AcademyRecord.fromJson(e))
          .toList();
      return academyRecords;
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Unexpected error occurred');
    }
  }

  Future<AcademyRecord> registerAcademyRecord(RegisterData registerData) async {
    try {
      final reponse = await _dio.post(
        '/academyrecord',
        data: registerData.toJson(),
      );
      final AcademyRecord academyRecord = AcademyRecord.fromJson(reponse.data);
      return academyRecord;
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Unexpected error occurred');
    }
  }
}
