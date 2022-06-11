import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomButtom({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
