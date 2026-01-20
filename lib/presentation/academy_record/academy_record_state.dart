import 'package:demo/data/network/model/academy_record.dart';
import 'package:equatable/equatable.dart';

sealed class AcademyRecordState extends Equatable {
  const AcademyRecordState();

  @override
  List<Object?> get props => [];
}

class AcademyRecordInitial extends AcademyRecordState {
  const AcademyRecordInitial();
}

class AcademyRecordLoading extends AcademyRecordState {
  const AcademyRecordLoading();
}

class AcademyRecordSuccess extends AcademyRecordState {
  final List<AcademyRecord> data;
  const AcademyRecordSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class AcademyRecordFail extends AcademyRecordState {
  final String error;
  const AcademyRecordFail(this.error);

  @override
  List<Object?> get props => [error];
}
