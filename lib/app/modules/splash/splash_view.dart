import 'dart:async';

import '../../../utils/import_export.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => DepartmentView());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1EC),
      body: Padding(
        padding: const EdgeInsets.all(20), // Optional spacing
        child: Image.asset(
          'assets/Logo Adv Flutter Application.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth, // or BoxFit.fitHeight
        ),
      ),
    );
  }
}
