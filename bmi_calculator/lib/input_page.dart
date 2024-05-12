import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const cardDarkColor = Color(0xFF1D1E33);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Row(
            children: [
              ReusableCard(colour: cardDarkColor),
              ReusableCard(colour: cardDarkColor)
            ],
          )),
          const ReusableCard(colour: cardDarkColor),
          const Expanded(
              child: Row(
            children: [
              ReusableCard(
                colour: cardDarkColor,
              ),
              ReusableCard(colour: cardDarkColor)
            ],
          )),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: bottomContainerColor,
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

// 'final' keyword is very similar to the 'const' only 'const' can't have values that is going to be set at runtime, but the 'final' can. For example the 'final' can be set to the 'DateTime.now()'
class ReusableCard extends StatelessWidget {
  // properties
  final Color colour;
  // final Widget cardChild;
  // constructor
  const ReusableCard({super.key, required this.colour});

  @override
  Widget build(BuildContext context) {
    // our reusable widgets
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      // child: cardChild,
    ));
  }
}
