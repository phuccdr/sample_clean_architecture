import 'package:demo/domain/usecase/get_academy_record.dart';
import 'package:demo/presentation/academy_record/academy_record_state.dart';
import 'package:demo/shared/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AcademyRecordCubit extends Cubit<AcademyRecordState> {
  AcademyRecordCubit(this._getAcademyRecordUseCase)
    : super(const AcademyRecordInitial());
  final GetAcademyRecordUseCase _getAcademyRecordUseCase;

  Future<void> getAcademyRecord() async {
    emit(const AcademyRecordLoading());
    final response = await _getAcademyRecordUseCase.execute();
    switch (response.status) {
      case Status.Success:
        emit(AcademyRecordSuccess(response.data ?? []));
      case Status.Loading:
        emit(const AcademyRecordLoading());
      case Status.Failed:
        emit(AcademyRecordFail(response.error ?? 'Hồ sơ không tồn tại'));
    }
  }
}
