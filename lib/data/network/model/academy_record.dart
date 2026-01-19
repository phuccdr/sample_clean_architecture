class AcademyRecord {
  final String id;
  final String name;
  final String avatar;

  AcademyRecord({required this.id, required this.name, required this.avatar});

  factory AcademyRecord.fromJson(Map<String, dynamic> json) {
    return AcademyRecord(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
