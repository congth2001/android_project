import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post.dart';

class PostRequest {
  static const String subdomain = 'facebook-8qes.onrender.com';
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
  static Future<List<Post>> getAllPosts(
      [String? index = '0',
      String? count = "100",
      String? last_id = "0"]) async {
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
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        // Trả về danh sách bản ghi
        return compute(
            parsePostList, resBody['data']['posts'] as List<dynamic>);
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print('Got error in Get All Posts: $e');
      return List<Post>.empty();
    }
  }

  /*
   * @desc API thông tin bài viết
   * @date 30/1/2023 
   */
  static Future<Post> getPostByID(String id) async {
    try {
      // init query params
      final queryParameters = {
        'id': id,
      };
      // get url
      url = Uri.https(subdomain, '$subdirectoryHead/get_post', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        // Trả về danh sách bản ghi
        return compute(parsePost, resBody['data'] as dynamic);
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print('Got error in Get post by id: $e');
      return Post();
    }
  }

  /*
   * @desc API xóa bài viết
   * @date 30/1/2023 
   */
  static Future deletePost(String id) async {
    try {
      // init query params
      final queryParameters = {
        'id': id,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/delete_post', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      /**
       * Thành công: {"code": "1000", "message": "OK"}
       * Thất bại: {"code": "9992", "message": "Post is not existed"}
       */
      return resBody;
    } catch (e) {
      print('Got error in Delete post: $e');
      return Post();
    }
  }

  /*
   * @desc API Đăng bài viết (hiện tại chỉ cho nhập nội dung)
   * @date 30/1/2023 
   */
  static Future addPost(
    String described,
    String token,
  ) async {
    try {
      // init query params
      final queryParameters = {
        'described': described,
        'token': token,
      };
      // get url
      url = Uri.https(subdomain, '$subdirectoryHead/add_post', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        /**
         * Thành công: { "id": "63dd1dcedad1370034cd5d69","url": null }
         */
        return resBody['data'];
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print('Got error in Add post: $e');
      return Post();
    }
  }

  /*
   * @desc API cập nhật bài viết (hiện tại chỉ cho nhập nội dung)
   * @date 30/1/2023 
   */
  static Future editPost(
    String token,
    String postID,
    String described,
  ) async {
    try {
      // init query params
      final queryParameters = {
        'token': token,
        'id': postID,
        'described': described,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/delete_post', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        /**
         * Thành công: { "id": "63dd1dcedad1370034cd5d69","url": null }
         */
        return resBody['data'];
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print('Got error in Add post: $e');
      return Post();
    }
  }
}
