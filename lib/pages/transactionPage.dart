import 'package:flutter/material.dart';

void main() {
  runApp(transactionPage());
}

class transactionPage extends StatelessWidget {
  const transactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
          child: Center(
        child: Container(
          child: Text("Transaction page"),
        ),
      )),
    );
  }
}
