import 'package:flutter/material.dart';
import 'package:demo/utilitys/util.dart';

void main() {
  runApp(signIn());
}

class signIn extends StatefulWidget {
  signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Text("Sign In"),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: "Name"),
                                  validator: (value) {
                                    if (value != 'jayanta') {
                                      return ('invalid user name');
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      labelText: "Password"),
                                  validator: (value) {
                                    if (value != "0000") {
                                      return ('wrong password');
                                    }
                                    return null;
                                  },
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
                                  Navigator.pushNamed(context, MyRoutes.signUp);
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
                                child: InkWell(
                                  child: const Text("Sign In"),
                                  onTap: () {
                                    moveToNextPage(context);
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
        ),
      ),
    );
  }
}
