import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/posts_model.dart';

class PostsController {
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
}
