import 'package:flutter/material.dart';

class battonWidgets extends StatelessWidget {
  String text;
  Color? color;
  Color? fontColor;
  final VoidCallback onClick;

  battonWidgets({
    super.key,
    required this.onClick,
    required this.text,
    this.fontColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            backgroundColor: color ?? Colors.grey.withOpacity(0.2),
          ),

          onPressed: onClick,
          child: Text(text,
              style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: fontColor ?? Colors.white)),
        ),
      ),
    );
  }
}
