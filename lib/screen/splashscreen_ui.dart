import 'package:flutter/material.dart';

class Splashui extends StatefulWidget {
  const Splashui({super.key});

  @override
  State<Splashui> createState() => _SplashuiState();
}

class _SplashuiState extends State<Splashui> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              //the children for the splashscreen goes here
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                    'https://img.icons8.com/?size=160&id=udMvpkRHbzzS&format=png'),
              )
            ],
          ),
          Positioned.fill(
            child: Image.asset(
              'images/randmBG.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
