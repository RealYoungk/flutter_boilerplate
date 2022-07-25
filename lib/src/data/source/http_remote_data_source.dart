import 'dart:convert';
import 'dart:io';

import 'package:kick_admin/src/exception/remote_exception.dart';
import 'package:logger/logger.dart';

import '../data.dart';
import 'package:http/http.dart' as http;

import 'package:kick_admin/src/constant/constant.dart' as env;

class HttpRemoteDataSource implements RemoteDataSource {
  final http.Client httpClient = http.Client();

  @override
  Future<http.Response> request({
    required HttpMethod httpMethod,
    required String path,
    required Map<String, dynamic> param,
  }) async {
    Map<String, String> header;
    header = {'Content-Type': 'application/json;charset=UTF-8'};

    late http.Response res;
    try {
      switch (httpMethod) {
        case HttpMethod.get:
          res = await getRequest(path, param, header);
          break;
        case HttpMethod.post:
          res = await postRequest(path, param, header);
          break;
        case HttpMethod.put:
          res = await putRequest(path, param, header);
          break;
        case HttpMethod.delete:
          res = await deleteRequest(path, param, header);
          break;
      }

      Logger logger = Logger();
      logger.v('HTTP LOG responseHeader << $path ${res.headers}');
      logger.v('HTTP LOG responseBody << $path ${utf8.decode(res.bodyBytes)}');

      return res;
    } catch (e) {
      rethrow;
    } finally {
      httpClient.close();
    }
  }

  Future<http.Response> getRequest(
    String path,
    Map<String, dynamic> param,
    Map<String, String> header,
  ) async {
    final Uri uri = Uri(
      scheme: env.kScheme,
      host: env.kHost,
      path: path,
      queryParameters: param,
    );

    final http.Response response = await httpClient.get(uri);

    if (response.statusCode != 200) {
      throw HttpException(
        'statusCode: ${response.statusCode}\nreason: ${response.reasonPhrase}',
      );
    }

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (responseBody.isEmpty) {
      throw ResponseEmptyException();
    }

    return responseBody;
  }

  Future<http.Response> postRequest(
    String path,
    Map<String, dynamic> param,
    Map<String, String> header,
  ) async {
    final Uri uri = Uri(
      scheme: env.kScheme,
      host: env.kHost,
      path: path,
      queryParameters: param,
    );

    final http.Response response = await httpClient.post(uri);

    if (response.statusCode != 200) {
      throw HttpException(
        'statusCode: ${response.statusCode}\nreason: ${response.reasonPhrase}',
      );
    }

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (responseBody.isEmpty) {
      throw ResponseEmptyException();
    }

    return responseBody;
  }

  Future<http.Response> putRequest(
    String path,
    Map<String, dynamic> param,
    Map<String, String> header,
  ) async {
    final Uri uri = Uri(
      scheme: env.kScheme,
      host: env.kHost,
      path: path,
      queryParameters: param,
    );

    final http.Response response = await httpClient.put(uri);

    if (response.statusCode != 200) {
      throw HttpException(
        'statusCode: ${response.statusCode}\nreason: ${response.reasonPhrase}',
      );
    }

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (responseBody.isEmpty) {
      throw ResponseEmptyException();
    }

    return responseBody;
  }

  Future<http.Response> deleteRequest(
    String path,
    Map<String, dynamic> param,
    Map<String, String> header,
  ) async {
    final Uri uri = Uri(
      scheme: env.kScheme,
      host: env.kHost,
      path: path,
      queryParameters: param,
    );

    final http.Response response = await httpClient.delete(uri);

    if (response.statusCode != 200) {
      throw HttpException(
        'statusCode: ${response.statusCode}\nreason: ${response.reasonPhrase}',
      );
    }

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (responseBody.isEmpty) {
      throw ResponseEmptyException();
    }

    return responseBody;
  }
}
