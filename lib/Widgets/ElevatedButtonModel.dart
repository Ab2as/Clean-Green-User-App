import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {required this.family,
      required this.size,
      required this.message,
      required this.onPressed,
      required this.col1,
      required this.col2,
      required this.col3,
      required this.col4,
      super.key});

  String message;
  final size;
  final family;
  final VoidCallback onPressed;
  final Color col1;
  final Color col2;
  final Color col3;
  final Color col4;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 190,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [col1, col2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: col3,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: col4,
              offset: const Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
                color: Colors.white,
                fontSize: size,
                fontWeight: FontWeight.bold,
                fontFamily: family),
          ),
        ),
      ),
    );
  }
}
