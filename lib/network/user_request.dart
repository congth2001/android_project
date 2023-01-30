import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserRequest {
  static var url = Uri();

  // get records list
  static List<User> parseUser(List<dynamic> data) {
    try {
      print('im here $data');
      List<User> users = data.map((model) => User.fromJson(model)).toList();
      return users;
    } catch (e) {
      print(e.toString());
    }
    return List<User>.empty();
  }

  /*
   * @desc get info all of users
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
      return compute(parseUser, data['data'] as List<dynamic>);
    } else if (res.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get users');
    }
  }

  /*
   * @desc login
   * @date 30/1/2023 
   */
  static Future login(String phoneNumber, String password) async {
    try {
      // get url
      url = Uri.http('localhost:8000', 'api/v1/users/login');
      // get response
      final res = await http.post(url, body: {phoneNumber, password});
      // get return data
      final data = jsonDecode(res.body);
      // check and return
      if (res.statusCode == 200) {
        return compute(parseUser, data['data'] as List<dynamic>);
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
   * @desc login
   * @date 30/1/2023 
   */
  static Future getUserByID(String id) async {
    try {
      // get url
      url = Uri.http('localhost:8000', 'api/v1/users/show/$id');
      // get response
      final res = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhdCIsImlkIjoiNjNhMzMyN2E5OGJkMDEzMmZjZWFiMDZlIiwiaWF0IjoxNjczMDgxMzMxfQ.wd_pxa0sdMNh__XvFmQPGZR4W6IDFNXOJTYDDK6eOUc',
        },
      );
      // get return data
      final data = jsonDecode(res.body);
      // check and return
      if (res.statusCode == 200) {
        // data['data'] has jsonMap type
        return data['data'] as dynamic;
      } else if (res.statusCode == 404) {
        throw Exception('Not Found');
      } else {
        throw Exception('Can\'t get users');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
