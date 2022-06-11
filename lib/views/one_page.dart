import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revisao_flutter/widgets/custom_button.dart';

class OnePage extends StatefulWidget {
  OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  int valorAleatorio = 0;

  random() async {
    for (var i = 0; i < 10; i++) {
      Future.delayed(Duration(seconds: 1));
      valorAleatorio = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButtom(
          onPressed: () {},
          title: "Custom BTN",
        ),
      ),
    );
  }
}
