import 'package:flutter/material.dart';

class PageCalc extends StatefulWidget {
  const PageCalc({super.key});

  @override
  State<PageCalc> createState() => _PageCalcState();
}

class _PageCalcState extends State<PageCalc> {
  String printInput = '';
  String input = '';
  String result = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';

  void calculate() {
    switch (operator) {
      case '+':
        result = (num1 + num2).toString();
        break;
      case '-':
        result = (num1 - num2).toString();
        break;
      case '×':
        result = (num1 * num2).toString();
        break;
      case '÷':
        result = (num1 / num2).toString();
        break;
      case '%':
        result = (num1 % num2).toString();
        break;
    }
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        printInput = '';
        input = '';
        result = '';
        num1 = 0.0;
        num2 = 0.0;
        operator = '';
      } else if (buttonText == '+/-') {
        if (input.startsWith('-')) {
          input = input.substring(1);
          printInput = printInput.substring(1);
        } else {
          input = '-' + input;
          printInput = '-' + printInput;
        }
      } else if (buttonText == '.') {
        if (!input.contains('.')) {
          input = input + '.';
          printInput = printInput + '.';
        }
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷' ||
          buttonText == '%') {
        num1 = double.parse(input);
        operator = buttonText;
        input = '';
        printInput = printInput + buttonText;
      } else if (buttonText == '=') {
        num2 = double.parse(input);
        calculate();
        num1 = double.parse(result);
        input = result;
        printInput = result;
        operator = '';
      } else {
        input = input + buttonText;
        printInput = printInput + buttonText;
      }

      print(buttonText);
      print(num1);
      print(num2);
      print(result);
      print(input);
      print(printInput);
    });
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 40,
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Calculator'),
      //   backgroundColor: Colors.black,
      // ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black87,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  Text(
                    // text input
                    printInput,
                    style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // Text(
                  //   //output kalkulator
                  //   result,
                  //   style: TextStyle(
                  //       fontSize: 50.0,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white70),
                  // ),
                ]),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                buildButton('AC', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 236, 76, 76)),
                buildButton('+/-', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
                buildButton('%', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
                buildButton('÷', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
                buildButton('7', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('8', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('9', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('×', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
                buildButton('4', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('5', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('6', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('-', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
                buildButton('1', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('2', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('3', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('+', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
                buildButton(
                    '+/-', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('0', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('.', Color.fromARGB(255, 15, 15, 15), Colors.white),
                buildButton('=', Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 6, 184, 51)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
