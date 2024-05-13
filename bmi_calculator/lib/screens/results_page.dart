import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

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
            const Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Normal',
                        style: kResultsTextSubtitle,
                      ),
                      Text(
                        '18',
                        style: kResultsNumber,
                      ),
                      Text(
                        'This is your results, do whatever you like I do not care!!!',
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
