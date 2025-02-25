// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 100),
        ),
        decoration: InputDecoration(
            prefixIcon:
                Icon(Icons.search, color: Color.fromRGBO(239, 227, 200, 1)),
            hoverColor: Colors.amber,
            fillColor: Color.fromRGBO(23, 16, 23, 100),
            filled: true,
            hintText: 'Pesquise aqui seu café favorito',
            hintStyle: TextStyle(color: Color.fromRGBO(239, 227, 200, 1)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
