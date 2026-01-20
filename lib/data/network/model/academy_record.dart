class AcademyRecord {
  final String id;
  final String name;
  final String avatar;
  final int yearOfBirth;
  final int englishLevel;
  final String phoneNumber;
  final String password;

  AcademyRecord({
    required this.id,
    required this.name,
    required this.avatar,
    required this.yearOfBirth,
    required this.englishLevel,
    required this.phoneNumber,
    required this.password,
  });

  factory AcademyRecord.fromJson(Map<String, dynamic> json) {
    return AcademyRecord(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      yearOfBirth: json['yearOfBirth'],
      englishLevel: json['englishLevel'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }
}
