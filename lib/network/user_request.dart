import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserRequest {
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
    url = Uri.http('localhost:8000', 'api/v1/users/getAllUsers');
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
   * @desc API đăng ký tài khoản người dùng
   * @date 30/1/2023 
   */
  static Future register(
      String username, String phoneNumber, String password) async {
    try {
      // get url
      url = Uri.http('localhost:8000', 'api/v1/users/register');
      // get response
      final res = await http.post(url, body: {
        "username": username,
        "phonenumber": phoneNumber,
        "password": password
      });
      // check and return
      if (res.statusCode == 201) {
        return res;
      } else if (res.statusCode == 400) {
        throw Exception('Bad request');
      } else {
        throw Exception('Can\'t create user');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /*
   * @desc API lấy thông tin theo ID
   * @date 30/1/2023 
   */
  static Future getUserByID(String id) async {
    try {
      // get url
      url = Uri.http('localhost:8000', 'api/v1/users/show/$id');
      // get token
      String token = await getToken();
      // get response
      final res = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (res.statusCode == 200) {
        return compute(parseUser, resBody['data'] as dynamic);
      } else if (res.statusCode == 404) {
        throw Exception('Not Found');
      } else {
        throw Exception('Can\'t get users');
      }
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
    url = Uri.http('localhost:8000', 'api/v1/friends/list');
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
      // get url
      url = Uri.http('localhost:8000', 'api/v1/users/login');
      // get response
      final res = await http
          .post(url, body: {"phonenumber": phoneNumber, "password": password});
      return res;
    } catch (e) {
      print(e.toString());
    }
  }
}
