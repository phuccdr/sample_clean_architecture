class RegisterData {
  final String? name;
  final String? avatar;
  final String? password;
  final String? phoneNumber;
  final int? yearOfBirth;
  final int? englishLevel;

  const RegisterData({
    this.phoneNumber,
    this.englishLevel,
    this.name,
    this.password,
    this.yearOfBirth,
    this.avatar =
        'https://tse2.mm.bing.net/th/id/OIP.P-Mv49b2Fonh1a6c69FIlAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
      'password': password,
      'phoneNumber': phoneNumber,
      'yearOfBirth': yearOfBirth,
      'englishLevel': englishLevel,
    };
  }
}
