import 'package:flutter/material.dart';

void main() {
  runApp(addExpenses());
}

class addExpenses extends StatelessWidget {
  const addExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("add expenses"),
          ),
        ),
      ),
    );
  }
}
