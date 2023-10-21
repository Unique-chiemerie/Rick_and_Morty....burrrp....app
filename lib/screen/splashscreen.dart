//let's refresh on Api's
import 'package:flutter/material.dart';
import 'package:rick_and_morty/screen/homescreen.dart';
import 'package:rick_and_morty/screen/splashscreen_ui.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    loader();
  }

  void loader() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Apiapp(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Splashui();
  }
}
