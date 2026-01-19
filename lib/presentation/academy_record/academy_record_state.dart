import 'package:demo/data/network/model/academy_record.dart';
import 'package:equatable/equatable.dart';

class AcademyRecordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AcademyRecordInitial extends AcademyRecordState {}

class AcademyRecordLoading extends AcademyRecordState {}

class AcademyRecordSuccess extends AcademyRecordState {
  final List<AcademyRecord>? data;
  AcademyRecordSuccess(this.data);
}

class AcademyRecordFail extends AcademyRecordState {
  final String error;
  AcademyRecordFail(this.error);
}
