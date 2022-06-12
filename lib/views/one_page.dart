import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:revisao_flutter/controllers/posts_controller.dart';

import 'package:revisao_flutter/widgets/custom_button.dart';
import '../models/posts_model.dart';

class OnePage extends StatefulWidget {
  OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<List<Post>>(
                valueListenable: _controller.posts,
                builder: (_, value, __) => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(value[index].title),
                  ),
                ),
              ),
              CustomButtom(
                onPressed: () => _controller.callApi(),
                title: "Custom BTN",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
