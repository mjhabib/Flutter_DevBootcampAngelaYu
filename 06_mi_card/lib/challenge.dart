import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppState());
}

class MyAppState extends StatelessWidget {
  const MyAppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                height: 600,
                width: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green[400],
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              Container(
                color: Colors.blue,
                height: 600,
                width: 100,
              )
            ],
          ))),
    );
  }
}
