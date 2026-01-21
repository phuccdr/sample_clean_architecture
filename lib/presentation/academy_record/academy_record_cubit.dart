import 'package:demo/domain/usecase/get_academy_record_use_case.dart';
import 'package:demo/presentation/academy_record/academy_record_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AcademyRecordCubit extends Cubit<AcademyRecordState> {
  AcademyRecordCubit(this._getAcademyRecordUseCase)
    : super(const AcademyRecordInitial());
  final GetAcademyRecordUseCase _getAcademyRecordUseCase;

  Future<void> getAcademyRecord() async {
    emit(const AcademyRecordLoading());
    final response = await _getAcademyRecordUseCase.execute().run();
    response.fold(
      (failure) => emit(AcademyRecordFail(failure)),
      (academyRecords) => emit(AcademyRecordSuccess(academyRecords)),
    );
  }
}
