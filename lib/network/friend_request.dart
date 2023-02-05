import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class FriendRequest {
  // Hằng số
  static const String subdomain = 'facebook-8qes.onrender.com';
  static const String subdirectoryHead = "/it4788/friend";
  // url of
  static var url;

  /*
   * @desc API Lấy danh sách tất cả bạn bè
   * @date 30/1/2023 
   */
  static Future getListSuggestedFriends(String token,
      [String? index = '1', String count = '5']) async {
    try {
      final queryParameters = {
        'token': token,
        'index': index,
        'count': count,
      };
      // get url
      url = Uri.https(subdomain, '$subdirectoryHead/get_list_suggested_friends',
          queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        return resBody['data'];
      } else {
        print('Got error in Get list suggested friends: ' + resBody['message']);
      }
    } catch (e) {
      print('Exception in Get list suggested friends: $e');
    }
  }

  /*
   * @desc API Lấy danh sách tất cả bạn bè
   * @date 30/1/2023 
   */
  static Future getUserFriendList(String token, String userID,
      [String? index = '0', String count = '100']) async {
    try {
      final queryParameters = {
        'token': token,
        'user_id': userID,
        'index': index,
        'count': count,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/get_user_friends', queryParameters);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        return resBody['data'];
      } else {
        print('Got error in Get list suggested friends: ' + resBody['message']);
      }
    } catch (e) {
      print('Exception in Get list suggested friends: $e');
    }
  }

  /*
   * @desc API Lấy danh sách yêu cầu kết bạn
   * @date 30/1/2023 
   */
  static Future getRequestedList(String token,
      [String? index = '0', String count = '100']) async {
    try {
      final queryParameters = {
        'token': token,
        'index': index,
        'count': count,
      };
      // get url
      url = Uri.https(subdomain, '$subdirectoryHead/get_requested_friends',
          queryParameters);
      // get response
      print(url);
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        return resBody['data'];
      } else {
        print('Got error in getRequestedList: ' + resBody['message']);
      }
    } catch (e) {
      print('Exception in getRequestedList: $e');
    }
  }

  /*
   * @desc API gửi lời mời kết bạn
   * @param userID: id của người muốn kết bạn
   * @date 30/1/2023 
   */
  static Future sendFriendInvitation(String token, String userID) async {
    try {
      final queryParameters = {
        'token': token,
        'user_id': userID,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/set_request_friend', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get return data
      final resBody = jsonDecode(res.body);
      // check and return
      if (resBody['code'] == '1000') {
        return resBody['data'];
      } else {
        print('Got error in getRequestedList: ' + resBody['message']);
      }
    } catch (e) {
      print('Exception in getRequestedList: $e');
    }
  }

  /*
   * @desc API phản hồi lời mời kết bạn
   * @param userID: id của người muốn gửi lời mời kết bạn
   * @param isAccept: 0 là từ chối, 1 là đồng ý
   * @date 30/1/2023 
   */
  static Future setAcceptFriend(
      String token, String userID, String isAccept) async {
    try {
      final queryParameters = {
        'token': token,
        'user_id': userID,
        'is_accept': isAccept,
      };
      // get url
      url = Uri.https(
          subdomain, '$subdirectoryHead/set_accept_friend', queryParameters);
      print(url);
      // get response
      final res = await http.post(url);
      // get body of res
      final resBody = jsonDecode(res.body);
      // print error in console log
      if (resBody['code'] != '1000') {
        print('Got error in setAcceptFriend: ' + resBody['details']);
      }
      // return
      return resBody;
    } catch (e) {
      print('Exception in setAcceptFriend: $e');
    }
  }
}
