import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          const SizedBox(
            height: 300,
          ),
          //the children for the splashscreen goes here
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 1, end: 0),
              duration: const Duration(seconds: 6),
              builder: (context, value, child) {
                return AnimatedOpacity(
                  opacity: showlogo ? value : 0.5,
                  duration: const Duration(seconds: 1),
                  child: child,
                );
              },
              child: Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'images/rick.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'loading characters',
            style: GoogleFonts.josefinSans(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 80,
            child: LinearProgressIndicator(
              color: Colors.green,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
