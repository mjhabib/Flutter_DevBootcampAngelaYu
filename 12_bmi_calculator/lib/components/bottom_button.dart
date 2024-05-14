import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final void Function() navigateTo;

  const BottomButton({super.key, required this.text, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateTo,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            text,
            style: kCalculateButtonStyle,
          ),
        ),
      ),
    );
  }
}
