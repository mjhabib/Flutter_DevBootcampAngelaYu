import 'package:flutter/material.dart';

void main() {
  runApp(const MiState());
}

class MiState extends StatelessWidget {
  const MiState({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            Text(
              'MJ Habib',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            Text(
              'Entrepreneur',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'SourceSans3',
                  letterSpacing: 2.5),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '+123456789',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontFamily: 'SourceSans3'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    size: 20,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'mail@y.com',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontFamily: 'SourceSans3'),
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
