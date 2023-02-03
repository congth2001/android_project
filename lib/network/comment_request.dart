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
   * @return comment mới được tạo
   * @date 30/1/2023 
   */
  static Future addComment(String token, String postID, String content) async {
    try {
      final queryParameters = {
        'token': token,
        'id': postID,
        'comment': content,
        'index': 0,
        'count': 100,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/set_comment', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      if (resBody['code'] == '1000') {
        /**
         * --------------- VÍ DỤ ---------------
         * {
            "id": "63dd27eedad1370034cd5d8b",
            "comment": "xịn xò",
            "created": "1675438062",
            "poster": {
                "id": "63dbe5a48d86cf00345b501f",
                "name": "null",
                "avatar": null
            },
            "is_blocked": "0"
        }
         */
        return resBody['data'];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
