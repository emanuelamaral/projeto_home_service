import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_home_service/src/components/buttons/switch_button_component.dart';
import 'package:projeto_home_service/src/provider/user_provider.dart';
import 'package:projeto_home_service/src/service/user_service.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({super.key});

  removeAccount(context, id) async {
    UserService userService = UserService();

    try {
      await userService.deleteUser(id);
      Fluttertoast.showToast(msg: "Usuário removido com sucesso.");
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      Fluttertoast.showToast(msg: "Não foi possível excluir o usuário.");
      print(e);
    }
  }

  exitApp(context) {
    Navigator.pushNamed(context, '/login');
    Fluttertoast.showToast(msg: "Você saiu!");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Notificações',
            style: TextStyle(fontFamily: 'Poppins', fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notificações Gerais',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SwitchButtonComponenet()
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Som',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SwitchButtonComponenet()
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vibração',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SwitchButtonComponenet()
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Atualizações do aplicativo',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SwitchButtonComponenet()
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Avançado',
            style: TextStyle(fontFamily: 'Poppins', fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.purple),
            child: TextButton(
                onPressed: () {
                  showConfirmationDialog(context, "Sair", () {
                    exitApp(context);
                  });
                },
                child: const Text(
                  'Sair',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                showConfirmationDialog(context, "Excluir conta", () {
                  removeAccount(context, user.userId);
                });
              },
              child: const Text(
                'Excluir a conta',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                ),
              )),
        ],
      ),
    );
  }

  void showConfirmationDialog(
      BuildContext context, String action, Function onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            "Aviso",
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          content: Text(
            "Tem certeza que deseja $action?",
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Não',
                  style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Sim',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
