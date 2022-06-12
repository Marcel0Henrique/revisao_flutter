import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:revisao_flutter/widgets/custom_button.dart';

class OnePage extends StatefulWidget {
  OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);

  callApi() async {
    var client = http.Client();
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(url);
      print('Response status: ${response.statusCode}');
      var decodeResponse = jsonDecode(response.body) as List;
      posts.value = decodeResponse.map((e) => Post.fromJson(e)).toList();
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<List<Post>>(
              valueListenable: posts,
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
              onPressed: () => callApi(),
              title: "Custom BTN",
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
      userId: parsedJson["userId"],
      id: parsedJson["id"],
      title: parsedJson["title"].toString(),
      body: parsedJson["body"].toString(),
    );
  }

  @override
  String toString() {
    return 'Post(userId: $userId, id: $id, title: $title, body: $body)';
  }
}
