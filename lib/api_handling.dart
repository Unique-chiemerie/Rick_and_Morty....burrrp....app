import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ricknmortyapi {
  final String name;
  final String status;
  final String species;

  const Ricknmortyapi({
    required this.name,
    required this.species,
    required this.status,
  });

  factory Ricknmortyapi.fromJson(Map<String, dynamic> json) {
    return Ricknmortyapi(
      name: json['name'],
      species: json['species'],
      status: json['status'],
    );
  }
}

Future<Ricknmortyapi> fetchData(int number) async {
  final response = await http.get(
    Uri.parse('https://rickandmortyapi.com/api/character/$number'),
  );

  return Ricknmortyapi.fromJson(
    jsonDecode(response.body),
  );
}

class Pic extends StatelessWidget {
  final int number;
  const Pic({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://rickandmortyapi.com/api/character/avatar/$number.jpeg',
      fit: BoxFit.scaleDown,
    );
  }
}
