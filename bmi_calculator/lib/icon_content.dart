import 'package:flutter/material.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData fontIcon;
  final String subText;
  const IconContent({super.key, required this.fontIcon, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fontIcon,
          size: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          subText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
