//let's refresh on Api's
import 'package:flutter/material.dart';
import 'package:rick_and_morty/screen/splashscreen.dart';

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
