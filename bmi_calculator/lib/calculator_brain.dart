import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({required this.height, required this.weight});

  double getResult() {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getText() {
    double bmi = getResult();

    if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    double bmi = getResult();

    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
