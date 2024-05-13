import 'package:flutter/material.dart';

class RoundCustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() pressed;

  const RoundCustomIconButton(
      {super.key, required this.icon, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      constraints: const BoxConstraints.tightFor(height: 30, width: 30),
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4c4F5E),
      child: Icon(icon),
    );
  }
}
