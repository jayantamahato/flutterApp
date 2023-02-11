import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(homePage());
}

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                               child: const CircleAvatar(
                                  radius: 30, // Image radius
                                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlIky8DlblDcWS1w8v05ssLYVsgOtKrJotlA&usqp=CAU',scale: 1.0),
                                ),
                              ),

                              Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Welcome",
                                        style: TextStyle(fontSize: 12,color: Colors.grey),
                                      ),
                                      Text(
                                        "jayanta",
                                        style: TextStyle(fontSize: 16,color: Colors.black),
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
                  offset: Offset(2.0,5.0),
                   blurRadius: 10.0,
                  spreadRadius: 0.0,
                  ),
                  ]
                  ),
                  height: 200,
                  width: 340,
                  child: Column(
                    children:  [
                      const SizedBox(height: 20,),
                      const Text("Total balance",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                      const SizedBox(height: 10,),
                      const Text("5000",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                      const SizedBox(height: 10,),

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
                                      Icon(Icons.arrow_downward,
                                      color: Colors.green,)
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                   Text("Income",style: TextStyle(color: Colors.white,fontSize: 12),),
                                    Text("2500",style: TextStyle(color: Colors.white,fontSize: 12),),

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
                                      Icon(Icons.arrow_upward,
                                      color: Colors.red,)
                                    ],
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Expenditure",style: TextStyle(color: Colors.white,fontSize: 12),),
                                    Text("2500",style: TextStyle(color: Colors.white,fontSize: 12),),

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
                        child: const Text(
                          "See All",
                          style: TextStyle(fontSize: 18),
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
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(1.0,2.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                ),
                              ]
                          ),

                          height: 60,
                          width: 330,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 70,
                          width: 330,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 70,
                          width: 330,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 70,
                          width: 330,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

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
                          children: const [
                            Icon(Icons.bar_chart,size: 35,)
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
                      offset: Offset(1.0,2.0),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    ),
                        ]
                    ),
                      height: 70,
                      width: 70,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add,
                          color: Colors.white,
                          size: 40,),
                        ],
                      ),
                    ),

                      Container(
                        child: Row(
                          children: const [
                            Icon(Icons.more_horiz_rounded,size: 35,)
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
}
