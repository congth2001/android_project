import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommentRequest {
  // Hằng số
  static const String subdomain = 'facebookhust.onrender.com';
  static const String subdirectoryHead = "/it4788/comment";
  // url of api
  static var url = Uri();

  /*
   * @desc API tạo comment
   * @date 30/1/2023 
   */
  static Future addComment(String id) async {
    try {
      final queryParameters = {
        'user_id': id,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/get_user_info', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // return promise
      return resBody;
    } catch (e) {
      print(e.toString());
    }
  }
}
