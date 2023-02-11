import 'package:demo/pages/addExpenses.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/signIn.dart';
import 'package:demo/pages/signIn.dart';
import 'package:demo/pages/signUp.dart';
import 'package:demo/pages/transactionPage.dart';
import 'package:demo/utilitys/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        MyRoutes.defaultRoute: (context) => signIn(),
        MyRoutes.signIn: (context) => signIn(),
        MyRoutes.signUp: (context) => signUp(),
        MyRoutes.home: (context) => homePage(),
        MyRoutes.addExpenses: (context) => addExpenses(),
        MyRoutes.transaction: (context) => transactionPage(),
      },
    );
  }
}
