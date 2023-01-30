// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// import '../models/post.dart';

// class PostRequest {
//   static var url = Uri();

//   // get records list
//   static List<Post> parsePostList(List<dynamic> data) {
//     try {
//       List<Post> Posts = data.map((model) => Post.fromJson(model)).toList();
//       return Posts;
//     } catch (e) {
//       print(e.toString());
//     }
//     return List<Post>.empty();
//   }

//   // get Post
//   static Post parsePost(dynamic data) {
//     try {
//       Post post = Post.fromJson(data);
//       return post;
//     } catch (e) {
//       print(e.toString());
//     }
//     return Post();
//   }

//   /*
//    * @desc API get info all of Posts
//    * @date 30/1/2023 
//    */
//   static Future<List<Post>> getAllPost() async {
//     // get url
//     url = Uri.http('localhost:8000', 'api/v1/posts/list');
//     // get response
//     final res = await http.get(url);
//     // get return data
//     final data = jsonDecode(res.body);
//     // check and return
//     if (res.statusCode == 200) {
//       return compute(parsePostList, data['data'] as List<dynamic>);
//     } else if (res.statusCode == 404) {
//       throw Exception('Not Found');
//     } else {
//       throw Exception('Can\'t get Posts');
//     }
//   }

//   /*
//    * @desc API lấy thông tin theo ID
//    * @date 30/1/2023 
//    */
//   static Future getPostByID(String id) async {
//     try {
//       // get url
//       url = Uri.http('localhost:8000', 'api/v1/Posts/show/$id');
//       // get response
//       final res = await http.get(
//         url,
//         headers: {
//           HttpHeaders.authorizationHeader:
//               'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhdCIsImlkIjoiNjNhMzMyN2E5OGJkMDEzMmZjZWFiMDZlIiwiaWF0IjoxNjczMDgxMzMxfQ.wd_pxa0sdMNh__XvFmQPGZR4W6IDFNXOJTYDDK6eOUc',
//         },
//       );
//       // get return data
//       final resBody = jsonDecode(res.body);
//       // check and return
//       if (res.statusCode == 200) {
//         return compute(parsePost, resBody['data'] as dynamic);
//       } else if (res.statusCode == 404) {
//         throw Exception('Not Found');
//       } else {
//         throw Exception('Can\'t get Posts');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
