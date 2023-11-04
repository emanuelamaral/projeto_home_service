class UserEntity {
  int? userId;
  final String name;
  final String email;
  final String password;
  final String cpf;

  UserEntity(
      {this.userId,
      required this.name,
      required this.cpf,
      required this.email,
      required this.password});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'],
      name: json['name'],
      email: json['email'] ?? '',
      password: json['password'],
      cpf: json['cpf'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'cpf': cpf,
    };
  }
}
