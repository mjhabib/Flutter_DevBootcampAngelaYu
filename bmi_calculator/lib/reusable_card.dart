// 'final' keyword is very similar to the 'const' only 'const' can't have values that is going to be set at runtime, but the 'final' can. For example the 'final' can be set to the 'DateTime.now()'
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // properties
  final Color colour;
  final Widget? cardChild;
  // '?' means this property can be null, or not required or without default value
  // constructor
  const ReusableCard({super.key, required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    // our reusable widgets
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: cardChild,
    );
  }
}
