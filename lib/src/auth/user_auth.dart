class UserAuth {
  int? userId;
  final String? email;
  final String? password;

  UserAuth({this.userId, required this.email, required this.password});

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      userId: json['userId'],
      email: json['email'] ?? '',
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'password': password,
    };
  }
}
