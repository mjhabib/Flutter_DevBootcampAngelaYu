import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('I am rich'),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
    ),
  ));
}
