import 'package:flutter/material.dart';

import '../../components/card/card_home_services.dart';

class HomePage extends StatelessWidget {
  final String textHomeService = 'Serviços domésticos';
  final String fontFamily = 'Poppins';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //     height: 120,
            //     width: double.infinity,
            //     color: Colors.red,
            //     child: const CardSwiperComponent()),
            // const SizedBox(
            //   height: 15,
            // ),
            // SizedBox(
            //   height: 120,
            //   width: 200,
            //   child: Column(
            //     children: [
            //       Text(
            //         textHomeService,
            //         style: TextStyle(
            //             fontFamily: fontFamily, fontWeight: FontWeight.bold),
            //       ),
            //       ListView.builder(
            //         // itemCount: noticiasAleatorias.length,
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //               onTap: () {
            //                 Navigator.pushNamed(context, '/main_page');
            //               },
            //               child: const CardHomeServicesComponent(
            //                   icon: Icon(Icons.format_paint_outlined),
            //                   bottomTitle: 'Pintura'));
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            Container(height: 100, width: double.infinity, color: Colors.green),
            const SizedBox(
              height: 15,
            ),
            Container(height: 200, width: double.infinity, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
