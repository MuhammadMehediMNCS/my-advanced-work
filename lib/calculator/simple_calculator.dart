import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class simpleCalculator extends StatelessWidget {
  const simpleCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primaryColor: Colors.blue.shade400),
      home: const calculatorWidget(),
    );
  }
}

class calculatorWidget extends StatefulWidget {
  const calculatorWidget({Key? key}) : super(key: key);

  @override
  State<calculatorWidget> createState() => _calculatorWidgetState();
}

class _calculatorWidgetState extends State<calculatorWidget> {
  String equation = "0";
  String result = "";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 50.0;

  buttonPressed(String buttonText) {
    setState(() {
      if(buttonText == "C") {
        equation = "0";
        result = "";

        equationFontSize = 38.0;
        resultFontSize = 50.0;
      } else if(buttonText == "⨂") {
        equation = equation.substring(0, equation.length -1);
        if(equation == ""){
          equation = "0";
        }

        equationFontSize = 38.0;
        resultFontSize = 50.0;
      } else if(buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 50.0;

        expression = equation;
        expression = expression.replaceAll("×", "*");
        expression = expression.replaceAll("÷", "/");
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch(e){
          result = "Invalid format used";
        }
      } else {
        if(equation == "0") {
          equation = buttonText;
        } else {
        equation = equation + buttonText;
        equationFontSize = 38.0;
        resultFontSize = 50.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          const Expanded(child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Divider(thickness: 2,),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, const Color.fromARGB(255, 232, 222, 233), Colors.red),
                        buildButton("√", 1, Colors.green.shade300, Colors.white),
                        buildButton("%", 1, Colors.green.shade300, Colors.white)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("M-", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("M+", 1, const Color.fromARGB(255, 232, 222, 233), Colors.green),
                        buildButton("MRC", 1, const Color.fromARGB(255, 232, 222, 233), Colors.green)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("8", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("9", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("5", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("6", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("2", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("3", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("0", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton(".", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black),
                        buildButton("=", 1, Colors.green, Colors.white)
                      ]
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("⨂", 1, const Color.fromARGB(255, 232, 222, 233), Colors.black)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("÷", 1, const Color.fromARGB(255, 232, 222, 233), Colors.green)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("×", 1, const Color.fromARGB(255, 232, 222, 233), Colors.green)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("-", 1, const Color.fromARGB(255, 232, 222, 233), Colors.green)
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("+", 2, const Color.fromARGB(255, 232, 222, 233), Colors.green)
                      ]
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: Colors.white,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.normal,
            color: textColor
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      )
    );
  }
}