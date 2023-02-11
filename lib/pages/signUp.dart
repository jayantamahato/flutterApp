import 'package:flutter/material.dart';
import 'package:demo/utilitys/util.dart';

void main() {
  runApp(signUp());
}

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formKey = GlobalKey<FormState>();
  moveToNextPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Material(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 251, 64, 126),
              Color.fromARGB(255, 159, 71, 241)
            ],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.topLeft,
          )),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(150, 255, 255, 255),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Text("Signup"),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration:
                                    const InputDecoration(labelText: "Name"),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Set Password"),
                              ),
                              TextFormField(
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
                                Navigator.pushNamed(context, MyRoutes.signIn);
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 251, 64, 126),
                                      Color.fromARGB(255, 159, 71, 241)
                                    ],
                                    begin: FractionalOffset.bottomRight,
                                    end: FractionalOffset.topLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              child: const Text("Sign Up"),
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
      ),
    );
  }
}
