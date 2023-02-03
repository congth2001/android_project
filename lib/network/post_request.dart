import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post.dart';

class PostRequest {
  static const String subdomain = 'facebookhust.onrender.com';
  static const String subdirectoryHead = "/it4788/post";
  // url of api
  static var url = Uri();

  // get records list
  static List<Post> parsePostList(List<dynamic> data) {
    try {
      List<Post> Posts = data.map((model) => Post.fromJson(model)).toList();
      return Posts;
    } catch (e) {
      print(e.toString());
    }
    return List<Post>.empty();
  }

  // get Post
  static Post parsePost(dynamic data) {
    try {
      Post post = Post.fromJson(data);
      return post;
    } catch (e) {
      print(e.toString());
    }
    return Post();
  }

  /*
   * @desc API danh sách bài viết
   * @date 30/1/2023 
   */
  static Future<List<Post>> getPostList(int index, int count,
      [String? last_id]) async {
    try {
      // init query params
      final queryParameters = {
        'index': index,
        'count': count,
        'last_id': last_id,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/get_list_posts', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        // Trả về danh sách bản ghi
        return compute(parsePostList, resBody['data'] as List<dynamic>);
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print('Got error in Get list of post: $e');
      return List<Post>.empty();
    }
  }
}
