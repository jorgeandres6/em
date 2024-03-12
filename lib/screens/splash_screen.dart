import 'package:ecomarket/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white
          /* gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 8, 8, 164),
          Color.fromARGB(255, 6, 149, 18)
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ) */
          ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 200,
        ),
        Image.asset(
          'images/logo.png',
          height: 400,
          width: 450,
        ),
        const Text(
          "Compra y venta de plástico",
          style: TextStyle(
              color: Color(0xFFa3d5ee),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        )
      ]),
    ));
  }
}
