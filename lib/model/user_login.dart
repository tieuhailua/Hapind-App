class UserLogin {
  late String email;
  late String password;

  UserLogin({required this.email, required this.password});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'username': String email,
        'password': String password,
      } =>
        UserLogin(
          email: email,
          password: password,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }
  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
    };
  }
}
