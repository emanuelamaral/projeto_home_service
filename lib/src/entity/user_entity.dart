import 'package:projeto_home_service/src/entity/address_entity.dart';

class UserEntity {
  int? userId;
  final String? name;
  final String? email;
  final String? password;
  final String? cpf;
  final AddressEntity? address;

  UserEntity({
    this.userId,
    required this.name,
    required this.cpf,
    required this.email,
    required this.password,
    this.address,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'],
      name: json['name'],
      email: json['email'] ?? '',
      password: json['password'],
      cpf: json['cpf'] ?? '',
      address: AddressEntity.fromJson(json['address'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'cpf': cpf,
      'address': address?.toJson(),
    };
  }
}
