import 'dart:ffi';

import 'package:calculator/widget/battonWidgets.dart';
import 'package:flutter/material.dart';

class Mycalculatorhome extends StatefulWidget {
  const Mycalculatorhome({super.key});

  @override
  State<Mycalculatorhome> createState() => _MycalculatorhomeState();
}

class _MycalculatorhomeState extends State<Mycalculatorhome> {
  String _output ="0";
  String _input ="0";
  String _ope =" ";
  double num1 = 0;
  double num2 = 0;

  void battonPress(String value) {
    print("Pressed: $value");
    setState(() {
      if (value == "C") {
        _output = "0";
        _input = "0";
        _ope = "";
        num1 = 0;
        num2 = 0;
      }
      else if (value == "⌫") {
        if (_input.isNotEmpty && _input != "0") {
          _input = _input.substring(0, _input.length - 1);
          if (_input.isEmpty) _input = "0";
          _output = _input;
        }
      }

      else if (["+", "-", "*", "÷", "%"].contains(value)) {
        num1 = double.parse(_input);
        _ope = value;
        _input = "";
      }
      else if (value == "=") {
        num2 = double.parse(_input);

        if (_ope == "+") {
          _output = (num1 + num2).toString();
        } else if (_ope == "-") {
          _output = (num1 - num2).toString();
        } else if (_ope == "*") {
          _output = (num1 * num2).toString();
        } else if (_ope == "÷") {
          _output = num2 != 0 ? (num1 / num2).toString() : "Cannot divide by zero";
        } else if (_ope == "%") {
          _output = ((num1 / num2) * 100).toString();
        }

        _input = _output;
        _ope = "";
      }
      else {
        if (_input == "0") {
          _input = value;
        } else {
          _input += value;
        }
        _output = _input;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (_ope.isNotEmpty && _input.isNotEmpty ) ? Text(
                        '$num1 $_ope $_input',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ) : SizedBox(),
                      SizedBox(height: 10),
                      Text(
                        _output,
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  battonWidgets(
                    onClick: ()=>battonPress('C'),
                    text: 'C',
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('⌫'),
                    text: '⌫',
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  battonWidgets(onClick: ()=>battonPress('%'), text: '%', color: Colors.green),
                  battonWidgets(onClick: ()=>battonPress('÷'), text: '÷', color: Colors.green),
                ],
              ),
              Row(
                children: [
                  battonWidgets(
                    onClick: ()=>battonPress('1'),
                    text: '1',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('2'),
                    text: '2',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('3'),
                    text: '3',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(onClick: ()=>battonPress('*'), text: '✱', color: Colors.green),
                ],
              ),
              Row(
                children: [
                  battonWidgets(
                    onClick: ()=>battonPress('4'),
                    text: '4',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('5'),
                    text: '5',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('6'),
                    text: '6',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(onClick: ()=>battonPress('-'), text: '-', color: Colors.green),
                ],
              ),
              Row(
                children: [
                  battonWidgets(
                    onClick: ()=>battonPress('7'),
                    text: '7',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('8'),
                    text: '8',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('9'),
                    text: '9',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(onClick: ()=>battonPress('+'), text: '+', color: Colors.green),
                ],
              ),
              Row(
                children: [
                  battonWidgets(
                    onClick: ()=>battonPress('00'),
                    text: '00',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('0'),
                    text: '0',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(
                    onClick: ()=>battonPress('.'),
                    text: '.',
                    fontColor: Colors.green,
                  ),
                  battonWidgets(onClick: ()=>battonPress('='), text: '=', color: Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
