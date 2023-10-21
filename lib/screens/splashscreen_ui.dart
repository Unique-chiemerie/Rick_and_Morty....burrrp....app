import 'package:flutter/material.dart';

class Splashui extends StatefulWidget {
  const Splashui({super.key});

  @override
  State<Splashui> createState() => _SplashuiState();
}

class _SplashuiState extends State<Splashui> {
  bool showlogo = true;
  @override
  void initState() {
    super.initState();
    startanimation();
  }

  void startanimation() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    while (true) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      setState(() {
        showlogo = !showlogo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 43, 43, 43),
      child: Column(
        children: [
          //the children for the splashscreen goes here
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return AnimatedOpacity(
                  opacity: showlogo ? value : 0.0,
                  duration: const Duration(milliseconds: 1),
                  child: child,
                );
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('images/rick.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
