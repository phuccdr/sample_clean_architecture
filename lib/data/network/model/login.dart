class LoginData {
  final String userName;
  final String password;

  LoginData({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': userName, 'password': password};
  }
}
