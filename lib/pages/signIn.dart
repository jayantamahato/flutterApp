import 'package:demo/pages/home.dart';
import 'package:demo/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:demo/utility/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class signIn extends StatefulWidget {
  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(
        body: signInContent(),
      ),
    );
  }
}

class signInContent extends StatefulWidget {
  const signInContent({Key? key}) : super(key: key);

  @override
  State<signInContent> createState() => _signInContentState();
}

class _signInContentState extends State<signInContent> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
//handle submit

    void handleSubmit() async {
      final name = nameController.text;
      final password = passController.text;

      if (name == '' || password == '') {
        const snackBar = SnackBar(
          content: Text(
            'felid can not be empty!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Please Wait...',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        final data = {"name": name, "password": password};
        const url = "https://flutterbackend-production.up.railway.app/signin";
        var uri = Uri.parse(url);
        final result = await http.post(uri,
            body: jsonEncode(data),
            headers: {'content-type': 'application/json'});
        if (result.statusCode == 200) {
          final data = jsonDecode(result.body);
          final userName = data['name'];
          print(userName);
          const snackBar = SnackBar(
            content: Text(
              'Log in successful',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => homePage(userName)));
        } else {
          const snackBar = SnackBar(
            content: Text(
              'log in failed',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }

    //sign up navigation function
    void nextPage() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => register()));
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
                      const Text("Sign In"),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "Name"),
                              controller: nameController,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration:
                                  const InputDecoration(labelText: "Password"),
                              controller: passController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: const Text("Sign Up"),
                            onTap: () {
                              nextPage();
                            },
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
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            child: InkWell(
                              child: const Text("Sign In"),
                              onTap: () {
                                handleSubmit();
                              },
                            ),
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
