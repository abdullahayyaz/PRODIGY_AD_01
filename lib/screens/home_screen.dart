import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _output = '';
  String _num1 = '';
  String _num2 = '';
  String _operand = '';
  String _lastResult = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = '';
        _num1 = '';
        _num2 = '';
        _operand = '';
      } else if (buttonText == "Ans") {
        if (_lastResult.isNotEmpty) {
          _num1 = _lastResult;
        }
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
        if (_operand.isEmpty && _num1.isNotEmpty) {
          _operand = buttonText;
        }
      } else if (buttonText == "=") {
        if (_num1.isNotEmpty && _num2.isNotEmpty && _operand.isNotEmpty) {
          double num1 = double.parse(_num1);
          double num2 = double.parse(_num2);
          double result = 0;

          switch (_operand) {
            case "+":
              result = num1 + num2;
              break;
            case "-":
              result = num1 - num2;
              break;
            case "X":
              result = num1 * num2;
              break;
            case "/":
              result = num1 / num2;
              break;
          }

          _output = result.toStringAsFixed(2);
          _lastResult = _output;
          _num1 = '';
          _num2 = '';
          _operand = '';
        }
      } else {
        if (_operand.isEmpty) {
          if (buttonText == "." && !_num1.contains(".")) {
            _num1 += buttonText;
          } else if (buttonText != ".") {
            _num1 += buttonText;
          }
        } else {
          if (buttonText == "." && !_num2.contains(".")) {
            _num2 += buttonText;
          } else if (buttonText != ".") {
            _num2 += buttonText;
          }
        }
      }
    });
  }

  String formatNumber(String number) {
    if (number.isEmpty) return '';
    double num = double.parse(number);
    if (num == num.toInt()) {
      return num.toInt().toString();
    } else {
      return num.toStringAsFixed(2);
    }
  }

  Widget buildButton(String buttonText, Color backgroundColor, Color textColor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
          padding: const EdgeInsets.symmetric(vertical: 20.0), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rectangular shape with slight rounding
          ),
          elevation: 30, // Elevation for a raised effect
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 254, 254),
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 25.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(40.0),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 4,color: Colors.black,style: BorderStyle.solid),
                boxShadow: [
                  BoxShadow(offset: Offset.zero,blurRadius: 5,spreadRadius: 2,blurStyle: BlurStyle.outer)
                ]

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _num1.isNotEmpty ? formatNumber(_num1) : '',
                        style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        _operand,
                        style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        _num2.isNotEmpty ? formatNumber(_num2) : '',
                        style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _output.isNotEmpty ? formatNumber(_output) : '',
                    style: const TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Divider(
                color: Colors.black,
                thickness: 0,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("8", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("9", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("/", const Color.fromARGB(255, 253, 253, 253), Colors.black),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildButton("4", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("5", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("6", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("X", const Color.fromARGB(255, 253, 253, 253), Colors.black),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildButton("1", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("2", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("3", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("-", const Color.fromARGB(255, 253, 253, 253), Colors.black),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildButton(".", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("0", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("00", const Color.fromARGB(255, 181, 178, 178), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("+", const Color.fromARGB(255, 253, 253, 253), Colors.black),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildButton("C", const Color.fromARGB(255, 253, 253, 253), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("Ans", const Color.fromARGB(255, 253, 253, 253), Colors.black),
                    const SizedBox(width: 10, height: 5),
                    buildButton("=", Color.fromARGB(255, 15, 15, 15), Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
