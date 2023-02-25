import 'package:demo/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class addIncome extends StatefulWidget {
  String userName;
  addIncome(this.userName);

  @override
  State<addIncome> createState() => _addIncomeState(userName);
}

class _addIncomeState extends State<addIncome> {
  var userName;
  _addIncomeState(this.userName);
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(body: incomeContent(widget.userName)),
    );
  }
}

class incomeContent extends StatefulWidget {
  var userName;
  incomeContent(this.userName);

  @override
  State<incomeContent> createState() => _incomeContentState();
}

class _incomeContentState extends State<incomeContent> {
  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();
    final noteController = TextEditingController();
    final dateController = TextEditingController();
    // form handle
    void onSubmit() async {
      final amount = amountController.text;
      final note = noteController.text;
      final date = dateController.text;
      if (amount == '' || date == '') {
        const snackBar = SnackBar(
          content: Text(
            'Amount & date can not be empty!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text(
            ' Please Wait.. ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        final data = {
          "name": widget.userName,
          "amount": amount,
          "massage": note,
          "date": date,
          "type": "income"
        };

        print("api calling...");
        print(data);
        final uri = Uri.parse(
            "https://flutterbackend-production.up.railway.app/maketransaction");
        final result = await http.post(uri,
            body: jsonEncode(data),
            headers: {'Content-Type': 'application/json'});
        if (result.statusCode == 201) {
          const snackBar = SnackBar(
            content: Text(
              ' Record Successful ',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          const snackBar = SnackBar(
            content: Text(
              ' Error! ',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }

    return Center(
      child: Container(
        color: const Color.fromARGB(255, 241, 241, 241),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //icon-container
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.cancel_rounded,
                      color: Colors.red,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => homePage(widget.userName)));
                    },
                  ),
                ],
              ),
              const Text(
                "ADD INCOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: amountController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Rs.",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.purple), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: noteController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Note",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.white), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Date",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.white), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        controller: dateController,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 145, 67),
                                Color.fromARGB(192, 213, 63, 254),
                                Color.fromARGB(188, 53, 137, 234),
                              ],
                              begin: FractionalOffset.bottomRight,
                              end: FractionalOffset.topLeft,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2.0, 5.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                            ]),
                        alignment: Alignment.center,
                        height: 40,
                        width: 250,
                        child: InkWell(
                          child: const Text("Save"),
                          onTap: () {
                            onSubmit();
                          },
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
