import 'dart:convert';
import 'dart:io';

import 'package:block_dio/models/post_model.dart';
import 'package:dio/dio.dart';

class Network {

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  static BaseOptions option = BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com",
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.plain,
    headers: {
      HttpHeaders.userAgentHeader: 'dio',
      'api': '1.0.0',
    },
  );

  // Dio Requests

  static Future<String> GET(String api, Map<String, String> params) async {
    var dio = Dio(option);
    Response response = await dio.get(api, queryParameters: params);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var dio = Dio(option);
    Response response = await dio.post(api, data: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var dio = Dio(option);
    Response response = await dio.put(api, data: params);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var dio = Dio(option);
    Response response = await dio.delete(api, queryParameters: params);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  // Params

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }

  //Parsing

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }

  static Post parsePost(String response) {
    dynamic json = jsonDecode(response);
    var data = Post.fromJson(json);
    return data;
  }

}