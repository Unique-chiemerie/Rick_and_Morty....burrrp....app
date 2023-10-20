//let's refresh on Api's
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/api_handling.dart';
import 'package:rick_and_morty/generation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      title: 'Api games',
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    ),
  );
}

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

int randomgen() {
  return Random().nextInt(200) + 1;
}

class Apiapp extends StatefulWidget {
  const Apiapp({super.key});

  @override
  State<Apiapp> createState() => _ApiappState();
}

class _ApiappState extends State<Apiapp> {
  late Future<Ricknmortyapi> futurama;
  int ran = randomgen();

  @override
  void initState() {
    super.initState();
    futurama = fetchData(ran);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rick and Morty App',
          style: GoogleFonts.baloo2(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          //the image above
          Container(
            height: 200,
            width: 70,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Pic(number: ran),
          ),

          FutureBuilder(
            future: futurama,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final charactername = snapshot.data!.name;
                final specie = snapshot.data!.species;
                final status = snapshot.data!.status;
                return SizedBox(
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          'Character name: $charactername',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Specie of character: $specie',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Status of character: $status',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      InkWell(
                        onTap: () {
                          fetchData(ran).then((newData) {
                            // Update the state with the new data
                            setState(() {
                              futurama = Future.value(newData);
                            });
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Genearating(),
                            ),
                          );
                        },
                        splashColor: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green,
                          ),
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                Center(
                  child: Text(
                    'There is no data available',
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.red),
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
