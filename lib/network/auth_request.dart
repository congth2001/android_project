import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthRequest {
  static const String subdomain = 'localhost:5000';
  static const String subdirectoryHead = "/it4788/auth";
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
  static Future signUp(String phoneNumber, String password) async {
    try {
      // init query params
      final queryParameters = {
        'phonenumber': phoneNumber,
        'password': password,
      };
      // ini
      // init urls
      url = Uri.http(subdomain, '$subdirectoryHead/signup', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        return resBody['data'];
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /*
   * @desc API cập nhật username
   * @date 30/1/2023 
   */
  static Future changeUsername(String username) async {
    try {
      // get token
      String token = await getToken();
      // init query params
      final queryParameters = {
        'token': token,
        'username': username,
      };
      // init urls
      url = Uri.http(subdomain, '$subdirectoryHead/change_info_after_signup',
          queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['data']['code'] == '1000') {
        return resBody['data']['data'];
      } else {
        throw Exception(resBody['message']);
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
      // init query params
      final queryParameters = {
        'phonenumber': phoneNumber,
        'password': password,
      };
      // get url
      url = Uri.http(subdomain, '$subdirectoryHead/login', queryParameters);
      // get response
      final res = await http.post(url);
      return res;
    } catch (e) {
      print(e.toString());
    }
  }
}
