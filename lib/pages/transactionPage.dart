import 'package:demo/pages/home.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class transactionPage extends StatefulWidget {
  String userName;
  transactionPage(this.userName);
  @override
  State<transactionPage> createState() => _transactionPageState();
}

class _transactionPageState extends State<transactionPage> {
  List resData = [];

  @override
  initState() {
    super.initState();
    apiCall();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.purple
          ),
      home: Material(
        child: Center(
          child: Container(
            color: const Color.fromARGB(255, 241, 241, 241),
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("ALL TRANSACTIONS"),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        homePage(widget.userName)));
                          },
                          child: const Icon(
                            Icons.cancel_rounded,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 630,
                    child: ListView.builder(
                      padding: EdgeInsets.all(2.0),
                      itemCount: resData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final response = resData[index] as Map;
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
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
                              padding: EdgeInsets.all(10.0),
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(response['amount'].toString() +
                                      "   [ " +
                                      response['type'] +
                                      " ] "),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(response['massage'].toString()),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void apiCall() async {
    print("api calling...");
    final data = {"name": widget.userName};
    final uri = Uri.parse(
        "https://flutterbackend-production.up.railway.app/transactions");
    final result = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (result.statusCode == 200) {
      final jsonResult = jsonDecode(result.body);
      final temp = jsonResult as List;
      setState(() {
        resData = temp;
      });
    } else {
      print("error while calling api...");
    }
  }
}
