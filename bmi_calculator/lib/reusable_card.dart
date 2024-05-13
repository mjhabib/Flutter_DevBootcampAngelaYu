// 'final' keyword is very similar to the 'const' only 'const' can't have values that is going to be set at runtime, but the 'final' can. For example the 'final' can be set to the 'DateTime.now()'
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // properties
  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;
  // '?' means this property can be null, or not required or without default value
  // constructor
  const ReusableCard(
      {super.key, required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    // our reusable widgets
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: cardChild,
      ),
    );
  }
}
