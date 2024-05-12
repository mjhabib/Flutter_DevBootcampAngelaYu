import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        title: const Text('Dicee'),
        backgroundColor: Colors.red[500],
      ),
      body: const DiceeState(),
    ),
  ));
}

// things meant to change in a stateful widget
class DiceeState extends StatefulWidget {
  const DiceeState({super.key});

  @override
  State<DiceeState> createState() => _DiceStateState();
}

class _DiceStateState extends State<DiceeState> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void ranNum() {
    // setState is essential to re-build the part of the app that is changing after pressing the button
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1; // 0 to 5 + 1
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            // flex: 2,
            child: TextButton(
                onPressed: () {
                  ranNum();
                },
                child: Image.asset('images/dice$leftDiceNum.png')),
          ),
          Expanded(
              // flex: 3,
              child: TextButton(
                  onPressed: () {
                    ranNum();
                  },
                  child:
                      Image(image: AssetImage('images/dice$rightDiceNum.png'))))
        ],
      ),
    );
  }
}
