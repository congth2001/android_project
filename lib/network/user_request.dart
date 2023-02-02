import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserRequest {
  // Hằng số
  static const String subdomain = 'facebookhust.onrender.com';
  static const String subdirectoryHead = "/it4788/user";
  // url of api
  static var url = Uri();
  // get token
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token").toString();
  }

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
   * @desc API Lấy danh sách tất cả người dùng
   * @date 30/1/2023 
   */
  static Future<List<User>> getAllUser() async {
    // get url
    url = Uri.https(subdomain, 'api/v1/users/getAllUsers');
    // get response
    final res = await http.get(url);
    // get return data
    final data = jsonDecode(res.body);
    // check and return
    if (res.statusCode == 200) {
      return compute(parseUserList, data['data'] as List<dynamic>);
    } else if (res.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get users');
    }
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

  /*
   * @desc API Lấy danh sách tất cả bạn bè
   * @date 30/1/2023 
   */
  static Future<List<User>> getAllFriends() async {
    // get url
    url = Uri.https('localhost:8000', 'api/v1/friends/list');
    // get token
    String token = await getToken();
    // get response
    final res = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    // get return data
    final data = jsonDecode(res.body);
    // check and return
    if (res.statusCode == 200) {
      return compute(parseUserList, data['data'] as List<dynamic>);
    } else if (res.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get users');
    }
  }

  /*
   * @desc API login
   * @date 30/1/2023 
   */
  static Future login(String phoneNumber, String password) async {
    try {
      // init query params
      final queryParameters = {
        'phonenumber': phoneNumber,
        'password': password,
      };
      // get url
      url = Uri.https(subdomain, '$subdirectoryHead/login', queryParameters);
      // get response
      final res = await http.post(url);
      return res;
    } catch (e) {
      print(e.toString());
    }
  }
}
