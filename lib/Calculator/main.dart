import 'package:calculator/Calculator/MyCalculatorHome.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApps());

}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'My Calculator',
      debugShowCheckedModeBanner: false,
      home: Mycalculatorhome(),
    );
  }
}
