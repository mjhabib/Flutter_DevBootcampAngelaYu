import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final void Function() onPressed;

  const RoundedButton({
    required this.btnColor,
    required this.btnText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: btnColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btnText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
