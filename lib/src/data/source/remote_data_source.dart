import 'package:http/http.dart' as http;

enum HttpMethod { post, put, get, delete }

abstract class RemoteDataSource {
  Future<http.Response> request({
    required HttpMethod httpMethod,
    required String path,
    required Map<String, dynamic> param,
  });
}
