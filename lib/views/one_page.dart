import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revisao_flutter/widgets/custom_button.dart';

class OnePage extends StatefulWidget {
  OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);

  random() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      valorAleatorio.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valorAleatorio,
              builder: (_, value, __) =>
                  Text("valor é ${valorAleatorio.value}"),
            ),
            CustomButtom(
              onPressed: () => random(),
              title: "Custom BTN",
            ),
          ],
        ),
      ),
    );
  }
}
