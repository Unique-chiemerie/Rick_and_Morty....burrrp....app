import 'package:flutter/material.dart';
import 'package:play_repo_renewed/main.dart';

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
    return const Material(
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          SizedBox(
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
          SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 50,
              child: LinearProgressIndicator(
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
