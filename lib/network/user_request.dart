import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserRequest {
  // Hằng số
  static const String subdomain = 'facebook-8qes.onrender.com';
  static const String subdirectoryHead = "/it4788/user";
  // url of api
  static var url = Uri();

  // get records list
  static List<User> parseUserList(List<dynamic> data) {
    try {
      List<User> users = data.map((model) => User.fromJson(model)).toList();
      return users;
    } catch (e) {
      print(e.toString());
    }
    return List<User>.empty();
  }

  // get user
  static User parseUser(dynamic data) {
    try {
      User user = User.fromJson(data);
      return user;
    } catch (e) {
      print(e.toString());
    }
    return User();
  }

  /*
   * @desc API lấy thông tin người dùng theo ID
   * @date 30/1/2023 
   */
  static Future getUserByID(String id) async {
    try {
      final queryParameters = {
        'user_id': id,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/get_user_info', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      if (resBody['code'] == '1000') {
        return compute(parseUser, resBody['data'] as dynamic);
      } else {
        throw Exception('Exception in get user by id: $resBody');
      }
    } catch (e) {
      print('Got error in get user by id: $e');
    }
  }

  /*
   * @desc API cập nhật thông tin người dùng (chưa có thay đổi ảnh)
   * @date 30/1/2023 
   */
  static Future updateUser(User user) async {
    try {
      final queryParameters = {
        'username': user.username,
        'description': user.description,
        'address': user.address,
        'city': user.city,
        'country': user.country,
        'link': user.link
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/set_user_info', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      if (resBody['code'] == '1000') {
        return compute(parseUser, resBody['data'] as dynamic);
      } else {
        throw Exception('Exception in get user by id: ' + resBody['message']);
      }
    } catch (e) {
      print('Got error in get user by id: $e');
    }
  }

  /*
   * @desc API ấn like bài viết
   * @return đối tượng chứa số like mới của bài viết
   * @date 30/1/2023
   */
  static Future like(String postID, String token) async {
    try {
      // init query params
      final queryParameters = {
        'id': postID,
        'token': token,
      };
      // get url
      url = Uri.https(subdomain, 'it4788/like/like', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        /**
         * Thành công: { "like": "1" }
         */
        return resBody['data'];
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print('Got error in like: $e');
    }
  }
}
