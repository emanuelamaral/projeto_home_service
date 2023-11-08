import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:projeto_home_service/src/pages/login/login_page.dart';
import 'package:projeto_home_service/src/pages/onboarding/first_onboard_page.dart';
import 'package:projeto_home_service/src/pages/onboarding/second_onboard_page.dart';
import 'package:projeto_home_service/src/pages/onboarding/third_onboard_page.dart';
import 'package:projeto_home_service/src/pages/registry/registry_page.dart';

class OnboardController extends StatelessWidget {
  const OnboardController({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardSlider(),
    );
  }
}

class OnboardSlider extends StatelessWidget {
  final Color kPurpleDark = const Color.fromARGB(250, 157, 78, 221);

  const OnboardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Cadastrar',
      onFinish: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegistryPage()));
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: kPurpleDark,
      ),
      skipTextButton: Text(
        'Pular',
        style: TextStyle(
            fontSize: 16,
            color: kPurpleDark,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins'),
      ),
      trailing: Text(
        'Entrar',
        style: TextStyle(
            fontSize: 16,
            color: kPurpleDark,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins'),
      ),
      trailingFunction: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      controllerColor: kPurpleDark,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Image.asset(
            'images/carpinteiro.jpg',
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Image.asset(
            'images/jardineira.jpg',
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Image.asset(
            'images/pintor.jpg',
            height: 400,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: const [
        FirstOnboardPage(),
        SecondOnboardPage(),
        ThirdOnboardPage(),
      ],
    );
  }
}
