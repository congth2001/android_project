import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthRequest {
  static const String subdomain = 'facebookhust.onrender.com';
  static const String subdirectoryHead = "/it4788/auth";
  // url of api
  static var url = Uri();

  // get token
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token").toString();
  }

  /**
   * @desc API lấy mã xác thực
   */
  static Future getVerifyCode(String phoneNumber) async {
    try {
      // init query params
      final queryParameters = {
        'phonenumber': phoneNumber,
      };
      // update url
      url = Uri.https(
          subdomain, '$subdirectoryHead/get_verify_code', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        return resBody['data']["verifyCode"];
      } else {
        throw Exception(resBody['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /**
   * @desc API kiểm tra mã xác thực
   */
  static Future checkVerifyCode(String phoneNumber, String code) async {
    try {
      // init query params
      final queryParameters = {
        'phonenumber': phoneNumber,
        'code': code,
      };
      // update url
      url = Uri.https(
          subdomain, '$subdirectoryHead/check_verify_code', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      return resBody;
    } catch (e) {
      print(e.toString());
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
      url = Uri.https(subdomain, '$subdirectoryHead/signup', queryParameters);
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
      url = Uri.https(subdomain, '$subdirectoryHead/change_info_after_signup',
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
