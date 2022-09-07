import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = '0';
  String finalResult = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String opr = '';

  void buttonPressed(String btnVal) {
    if (btnVal == 'AC') {
      finalResult = '0';
      num1 = 0.0;
      num2 = 0.0;
      opr = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      num1 = double.parse(result);
      opr = btnVal;
      finalResult = '0';
      result = result + btnVal;
    } else if (btnVal == '.') {
      if (finalResult.contains('.')) {
      } else {
        finalResult = finalResult + btnVal;
      }
    } else if (btnVal == '+/-') {
      if (result.toString().contains('-')) {
        result.toString().substring(1);
        finalResult = result;
      } else {
        result = '-' + result;
        finalResult = result;
      }
    } else if (btnVal == '%') {
      num2 = double.parse(result);
      finalResult = (num2 / 100).toString();
    } else if (btnVal == '=') {
      num2 = double.parse(result);
      if (opr == '+') {
        finalResult = (num1 + num2).toString();
      } else if (opr == '-') {
        finalResult = (num1 - num2).toString();
      } else if (opr == 'X') {
        finalResult = (num1 * num2).toString();
      } else if (opr == '/') {
        finalResult = (num1 / num2).toString();
      }
    } else {
      finalResult = finalResult + btnVal;
    }
    setState(() {
      result = double.parse(finalResult).toString();
    });
  }

  Widget defaultButton({
    required String text,
    required Color color,
    required Color textColor,
  }) {
    if (text != '0') {
      return Column(
        children: [
          Container(
            width: 75,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextButton(
              onPressed: () {
                buttonPressed(text);
              },
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextButton(
              onPressed: () {
                buttonPressed(text);
              },
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    finalResult,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    defaultButton(
                      text: 'AC',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                    defaultButton(
                      text: '7',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    defaultButton(
                      text: '4',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    defaultButton(
                      text: '1',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                Column(
                  children: [
                    defaultButton(
                      text: '+/-',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                    defaultButton(
                      text: '8',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    defaultButton(
                      text: '5',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    defaultButton(
                      text: '2',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                Column(
                  children: [
                    defaultButton(
                      text: '%',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                    defaultButton(
                      text: '9',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    defaultButton(
                      text: '6',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    defaultButton(
                      text: '3',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                Column(
                  children: [
                    defaultButton(
                      text: '/',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                    defaultButton(
                      text: 'X',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                    defaultButton(
                      text: '-',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                    defaultButton(
                      text: '+',
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                defaultButton(
                  text: '0',
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                defaultButton(
                  text: '.',
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                defaultButton(
                  text: '=',
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
