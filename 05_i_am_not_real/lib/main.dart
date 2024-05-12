import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('I am not real!'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent[700],
      ),
      body: const Center(
        child: Image(
          image: NetworkImage('https://thispersondoesnotexist.com'),
        ),
      ),
    ),
  ));
}
