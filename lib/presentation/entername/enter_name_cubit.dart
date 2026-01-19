import 'package:demo/presentation/entername/enter_name_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EnterNameCubit extends Cubit<EnterNameState> {
  EnterNameCubit() : super(const EnterNameState());

  void onNameChanged(String value) {
    final isValid = EnterNameState.validateName(value);
    emit(state.copyWith(name: value, isValid: isValid));
  }
}
