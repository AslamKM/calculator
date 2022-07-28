import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/widget/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> buttons = [
    "AC",
    "DLT",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "=",
  ];

  var userinput = "";
  var useroutput = "";
  void expressions() {
    Parser p = Parser();
    Expression exp = p.parse(userinput);
    ContextModel cm = ContextModel();
    var eval = exp.evaluate(EvaluationType.REAL, cm);
    useroutput = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userinput,
                    style: const TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 35,
                    top: 30,
                    bottom: 30,
                  ),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      useroutput,
                    ),
                  ),
                ),
                Expanded(
                    //  flex: 2,
                    child: SizedBox(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      //    print(userinput);
                      //All clear
                      if (index == 0) {
                        return AllButtons(
                          onPressed: () {
                            setState(() {
                              userinput = "";
                              useroutput = "";
                              //expressions();
                            });
                          },
                          buttontext: buttons[index],
                        );
                        //Backspace
                      }
                      //deleting the last entry from calculation
                       else if (index == 1) {
                        return AllButtons(
                          onPressed: () {
                            setState(() {
                              var delInput = "";

                              //finding last entry to be deleted if more than 2 elements are there
                              if (userinput.length > 2) {
                                delInput = userinput.substring(
                                    userinput.length - 2, userinput.length - 1);
                              }
                              //if only one entry to delete
                              if (userinput.length == 1) {
                                userinput = "";
                                useroutput = "";
                              }
                              //checking whether the last item to be deleted a digit or not 
                              else if (delInput == '0' ||
                                  delInput == '1' ||
                                  delInput == '2' ||
                                  delInput == '3' ||
                                  delInput == '4' ||
                                  delInput == '5' ||
                                  delInput == '6' ||
                                  delInput == '7' ||
                                  delInput == '8' ||
                                  delInput == '9') {
                                userinput = userinput.substring(
                                    0, userinput.length - 1);
                                expressions();
                              } else { 
                               userinput = userinput.substring(
                                    0, userinput.length - 1);
                              }
                            });
                          },
                          buttontext: buttons[index],
                        );
                      } 
                      //logic for operators
                      else if (index == 2 ||
                          index == 3 ||
                          index == 7 ||
                          index == 11 ||
                          index == 15) {
                        return AllButtons(
                          onPressed: () {
                            setState(() {
                              userinput = userinput + buttons[index];
                            });
                          },
                          buttontext: buttons[index],
                        );
                        //Evaluation
                      } else if (index == buttons.length - 1) {
                        return AllButtons(
                          onPressed: () {
                            setState(() {
                              expressions();
                            });
                          },
                          buttontext: buttons[index],
                        );
                        //Digits, expressions
                      } else {
                        return AllButtons(
                          onPressed: () {
                            setState(() {
                              userinput = userinput + buttons[index];
                              expressions();
                            });
                          },
                          buttontext: buttons[index],
                        );
                      }
                    },
                  ),
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
