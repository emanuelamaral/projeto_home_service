import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_home_service/src/entity/address_entity.dart';
import 'package:provider/provider.dart';

import '../entity/user_entity.dart';
import '../provider/user_provider.dart';
import '../service/user_service.dart';

class UserUpdate {
  UserUpdate(
      {required this.id,
      required this.streetController,
      required this.numberController,
      required this.districtController,
      required this.cityController,
      required this.stateController,
      required this.complementController,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  final int id;
  final String nameController;
  final String emailController;
  final String passwordController;
  final String streetController;
  final String numberController;
  final String districtController;
  final String cityController;
  final String stateController;
  final String complementController;

  final UserService userService = UserService();

  void updateUser(context) async {
    final userId = id;
    final name = nameController;
    final email = emailController;
    final password = passwordController;
    final street = streetController;
    final number = numberController;
    final district = districtController;
    final city = cityController;
    final state = stateController;
    final complement = complementController;

    final AddressEntity addressEntity = AddressEntity(
        street: street,
        numberOfHouse: number,
        district: district,
        city: city,
        state: state,
        complement: complement);

    final UserEntity userEntity = UserEntity(
      userId: userId,
      name: name,
      email: email,
      password: password,
      address: addressEntity,
      cpf: "",
    );
    try {
      UserEntity userUpdated = await userService.updateUser(userEntity);
      Fluttertoast.showToast(msg: "Usuário atualizado com sucesso.");

      Provider.of<UserProvider>(context, listen: false).setUser(userUpdated);
    } catch (e) {
      Fluttertoast.showToast(msg: "Falha na atualização");
      print(e);
    }
  }
}
