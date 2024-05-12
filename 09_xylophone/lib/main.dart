import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());
// we can use 'arrow function' / 'fat arrow function' when we only have one single line of instruction

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  // Expanded colorButton({Color rainbowColor, int soundNum}) { // named arg syntax
  // the return type of this function is 'Expanded' instead of 'void'
  Expanded colorButton(Color rainbowColors, int soundNum) {
    return Expanded(
      child: Container(
        color: rainbowColors,
        child: TextButton(
          onPressed: () async {
            final player = AudioPlayer();
            await player.play(AssetSource('note$soundNum.wav'));
          },
          child: const Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // colorButton(rainbowColor: Colors.red,  soundNum:1),  // named arg syntax
              colorButton(Colors.red, 1),
              colorButton(Colors.orange, 2),
              colorButton(Colors.yellow, 3),
              colorButton(Colors.green, 4),
              colorButton(Colors.blue, 5),
              colorButton(Colors.indigo, 6),
              colorButton(Colors.purple, 7),
            ],
          ),
        ),
      ),
    ));
  }
}
