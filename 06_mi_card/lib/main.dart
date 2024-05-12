import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              height: 100,
              width: 100,
              // margin: const EdgeInsets.fromLTRB(10, 15, 5, 20),
              // padding: const EdgeInsets.all(20),
              child: const Text('Container 1'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.purple,
              height: 100,
              width: 150,
              child: const Text('Container 2'),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
              child: const Text('Container 3'),
            )
          ],
        )),
      ),
    );
  }
}
