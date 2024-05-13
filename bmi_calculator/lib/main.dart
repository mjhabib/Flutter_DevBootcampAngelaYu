import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xFF0A0A21)),
          scaffoldBackgroundColor: const Color(0xFF0A0A21)),

      // theme: ThemeData(
      //     appBarTheme: const AppBarTheme(
      //         color: Color(0xFF0A0A21),
      //         titleTextStyle: TextStyle(color: Colors.white)),
      //     scaffoldBackgroundColor: const Color(0xFF0A0A21),
      //     textTheme:
      //         const TextTheme(bodyMedium: TextStyle(color: Colors.white))),

      home: const InputPage(),
    );
  }
}
