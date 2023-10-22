import 'package:flutter/material.dart';

import 'package:rick_and_morty/screens/homescreen.dart';

class Genearating extends StatefulWidget {
  const Genearating({super.key});

  @override
  State<Genearating> createState() => _GenearatingState();
}

class _GenearatingState extends State<Genearating> {
  @override
  void initState() {
    super.initState();
    loader();
  }

  void loader() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Apiapp(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const SizedBox(
            width: 150,
            child: Center(
              child: Text(
                'Generating Rick and Morty Characters',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 50,
              child: LinearProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
