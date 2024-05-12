import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
          title: const Text('Ask me anything!'),
          backgroundColor: Colors.green[800],
        ),
        body: const MagicBall(),
      ),
    ),
  ));
}

class MagicBall extends StatelessWidget {
  const MagicBall({super.key});

  @override
  Widget build(BuildContext context) {
    return const Ball();
  }
}

int num = 1;
void randNum() {
  num = Random().nextInt(5) + 1;
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            randNum();
          });
        },
        child: Column(
          children: [Image.asset('images/ball$num.png')],
        ),
      ),
    );
  }
}
