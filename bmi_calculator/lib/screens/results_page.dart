import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiText;
  final String bmiResult;
  final String bmiInterpretation;

  const ResultsPage(
      {super.key,
      required this.bmiText,
      required this.bmiResult,
      required this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
                child: Center(
              child: Text(
                'Your result',
                style: kResultsTextTitle,
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiText,
                        style: kResultsTextSubtitle,
                      ),
                      Text(
                        bmiResult,
                        style: kResultsNumber,
                      ),
                      Text(
                        bmiInterpretation,
                        style: kResultsExplainText,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            BottomButton(
              navigateTo: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATOR',
            )
          ],
        ),
      ),
    );
  }
}
