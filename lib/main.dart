import 'package:demo/pages/addExpenses.dart';
import 'package:demo/pages/addIncome.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/signIn.dart';
import 'package:demo/pages/register.dart';
import 'package:demo/pages/transactionPage.dart';
import 'package:demo/utility/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.defaultRoute: (context) => signIn(),
      },
    );
  }
}
