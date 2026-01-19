import 'package:equatable/equatable.dart';

class EnterNameState extends Equatable {
  const EnterNameState({this.name = '', this.isValid = false});

  final String name;
  final bool isValid;

  static bool validateName(String name) {
    return name.trim().length >= 2;
  }

  EnterNameState copyWith({String? name, bool? isValid}) {
    return EnterNameState(
      name: name ?? this.name,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [name, isValid];
}
