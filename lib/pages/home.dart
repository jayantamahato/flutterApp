import 'dart:convert';
import 'package:demo/pages/addExpenses.dart';
import 'package:demo/pages/addIncome.dart';
import 'package:demo/pages/signIn.dart';
import 'package:demo/pages/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class homePage extends StatefulWidget {
  String userName;
  homePage(this.userName);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var balance = "0";
  var income = "0";
  var expenses = "0";
  List resData = [];

  // String get name => name;
  @override
  initState() {
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Container(
          color: const Color.fromARGB(255, 241, 241, 241),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),

              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: const CircleAvatar(
                                  radius: 30, // Image radius
                                  backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlIky8DlblDcWS1w8v05ssLYVsgOtKrJotlA&usqp=CAU',
                                      scale: 1.0),
                                ),
                              ),
                              Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Welcome",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Text(
                                        widget.userName,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                height: 70,
              ),

              Container(
                alignment: Alignment.center,
                height: 190,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 145, 67),
                          Color.fromARGB(192, 213, 63, 254),
                          Color.fromARGB(188, 53, 137, 234),
                        ],
                        begin: FractionalOffset.bottomRight,
                        end: FractionalOffset.topLeft,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  height: 200,
                  width: 340,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Total balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        balance,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 90,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white38,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.arrow_downward,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Income",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      income,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white38,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Expenditure",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      expenses,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: 80,
                        height: 80,
                        child: InkWell(
                          child: const Text(
                            "See All",
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        transactionPage(widget.userName)));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  height: 300,
                  width: 700,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 330,
                      child: ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: resData.length,
                        itemBuilder: (BuildContext context, int index) {
                          final response = resData[index] as Map;
                          return Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(1.0, 2.0),
                                      blurRadius: 5.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(20.0),
                                height: 90,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(response['type']
                                        .toString()
                                        .toUpperCase()),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("RS." +
                                            response['amount'].toString()),
                                        Text(
                                          response['date'].toString(),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )),

              Container(
                alignment: Alignment.center,
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const Icon(
                                Icons.add_task,
                                color: Colors.green,
                                size: 35,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        addIncome(widget.userName)));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 145, 67),
                                Color.fromARGB(192, 213, 63, 254),
                                Color.fromARGB(188, 53, 137, 234),
                              ],
                              begin: FractionalOffset.bottomRight,
                              end: FractionalOffset.topLeft,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(1.0, 2.0),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                              ),
                            ]),
                        height: 70,
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 40,
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) =>
                                      addExpenses(widget.userName),
                                ));
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              // ignore: prefer_const_constructors
                              child: Icon(
                                Icons.refresh_rounded,
                                color: Colors.blue,
                                size: 35,
                              ),
                              onTap: () {
                                apiCall();
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  apiCall() async {
    print("api calling...");
    final data = {"name": widget.userName};
    final uri = Uri.parse(
        "https://flutterbackend-production.up.railway.app/accountDetails");
    final uri2 = Uri.parse(
        "https://flutterbackend-production.up.railway.app/transactions");
    final result = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    final transactionResult = await http.post(uri2,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    final temp = jsonDecode(result.body.toString());
    final transactionjson = jsonDecode(transactionResult.body);
    final transactions = transactionjson as List;
    if (result.statusCode == 200) {
      setState(() {
        balance = temp['availableBalance'].toString();
        income = temp['income'].toString();
        expenses = temp['expenses'].toString();
        resData = transactions;
      });
    } else {
      print("error api calling...");
    }
  }
}
