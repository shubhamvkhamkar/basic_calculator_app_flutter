import 'package:basic_calculator_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';

  //Array of Button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: Text('CalculatorApp'),
        ),
        backgroundColor: Colors.white38,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        //Clear button
                        if (index == 0) {
                          return MyButton(
                              buttontapped: () {
                                setState(() {
                                  userInput = '';
                                  answer = '0';
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.blue[50],
                              textColor: Colors.black);
                        }
                        // +/- button
                        else if (index == 1) {
                          return MyButton(
                            buttonText: buttons[index],
                            color: Colors.blue[50],
                            textColor: Colors.black,);
                        }
                        // % button
                        else if (index == 2) {
                          return MyButton(
                            buttontapped: () {
                              setState(() {
                                userInput += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.blue[50],
                            textColor: Colors.black,);
                        }
                        // Delete Button
                        else if (index == 3) {
                          return MyButton(
                              buttontapped: () {
                                setState(() {
                                  userInput =
                                      userInput.substring(
                                          0, userInput.length - 1);
                                }

                                );
                              },
                              buttonText: buttons[index],
                              color: Colors.blue[50],
                              textColor: Colors.black);
                        }
                        // Equal_to Button
                        else if (index == 18) {
                          return MyButton(buttontapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                            buttonText: buttons[index],
                            color: Colors.orange[700],
                            textColor: Colors.white,

                          );
                        }
                        // other buttons
                        else {
                          return MyButton(
                            buttontapped: (){
                              setState(() {
                                userInput += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                      ? Colors.blueAccent
                                      : Colors.white,
                            textColor:  isOperator(buttons[index])
                                       ? Colors.white
                                       : Colors.black,


                          );
                        }
                      }),
                ))
          ],
        )
    );
  }


  bool isOperator(String x) {
    if (x == '/' || x == '+' || x == '-' || x == 'x' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double evel = exp.evaluate(EvaluationType.REAL, cm);
    answer = evel.toString();

  }

  }

