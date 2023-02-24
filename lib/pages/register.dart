import 'package:demo/pages/signIn.dart';
import 'package:flutter/material.dart';
import 'package:demo/utility/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(register());
}

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        body: signUpContent(),
      ),
    );
  }
}

class signUpContent extends StatefulWidget {
  @override
  State<signUpContent> createState() => _signUpContentState();
}

class _signUpContentState extends State<signUpContent> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController conPasswordController = TextEditingController();
    void nextPage() {
      Navigator.push(
        context,
        // ignore: unnecessary_new
        new MaterialPageRoute(
          builder: (context) => signIn(),
        ),
      );
    }

    void handleSubmit() async {
      final name = nameController.text;
      final pass = passwordController.text;
      final conPass = conPasswordController.text;

      if (pass != conPass) {
        const snackBar = SnackBar(
          content: Text(
            'password mismatched!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (pass == '' || conPass == '' || name == '') {
        // ignore: prefer_const_constructors
        final snackBar = SnackBar(
          content: const Text(
            'feild can not be empty!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Please Wait....',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("api calling");
        final data = {"name": name, "password": pass};
        const url = "https://flutterbackend-production.up.railway.app/account";
        var uri = Uri.parse(url);
        final result = await http.post(uri,
            body: jsonEncode(data),
            headers: {'Content-Type': 'application/json'});
        // ignore: unrelated_type_equality_checks
        if (result.statusCode == 201) {
          final snackBar = SnackBar(
            action: SnackBarAction(
                label: "OK",
                onPressed: () {
                  nextPage();
                }),
            content: const Text(
              'account created successfully',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          // ignore: prefer_const_constructors
          final snackBar = SnackBar(
            content: const Text(
              'internal error, try again!',
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 145, 67),
              Color.fromARGB(192, 213, 63, 254),
              Color.fromARGB(188, 53, 137, 234),
            ],
            begin: FractionalOffset.bottomRight,
            end: FractionalOffset.topLeft,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(150, 255, 255, 255),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text("Signup"),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration:
                                  const InputDecoration(labelText: "Name"),
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  labelText: "Set Password"),
                            ),
                            TextFormField(
                              controller: conPasswordController,
                              decoration: const InputDecoration(
                                  labelText: "Confirm Password"),
                              obscureText: true,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: const Text("Sign In"),
                            onTap: () {
                              nextPage();
                            },
                          ),
                          InkWell(
                            child: Container(
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
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              child: const Text("Sign Up"),
                            ),
                            onTap: () {
                              handleSubmit();
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
