import 'dart:convert';

import 'package:kick_admin/src/data/entity/admin_entity.dart';
import 'package:kick_admin/src/data/source/remote_data_source.dart';
import 'package:kick_admin/src/domain/admin/admin.dart';

class AdminRepositoryRemote implements AdminRepository {
  @override
  RemoteDataSource dataSource;

  AdminRepositoryRemote(this.dataSource);

  @override
  Future<AdminModel> delete(Map<String, dynamic> param) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<AdminModel> signin(Map<String, dynamic> param) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<AdminModel> signout(Map<String, dynamic> param) {
    // TODO: implement signout
    throw UnimplementedError();
  }

  @override
  Future<AdminModel> signup(Map<String, dynamic> param) async {
    var res = await dataSource.request(
      httpMethod: HttpMethod.post,
      path: 'path',
      param: param,
    );

    var responseEntity = AdminEntity.fromJson(
      json.decode(utf8.decode(res.bodyBytes)),
    );

    AdminModel model = AdminModel();

    return model;
  }
}

// class RemoteRepository implements RemoteDataSource {
//   final http.Client httpClient;
//
//   const RemoteRepository({
//     required this.httpClient,
//   });
//
//   @override
//   Future<http.Response> request({
//     required HttpMethod httpMethod,
//     required String path,
//     required Map<String, dynamic> param,
//   }) async {
//     Map<String, String> header;
//     header = {'Content-Type': 'application/json;charset=UTF-8'};
//
//     late http.Response res;
//     try {
//       switch (httpMethod) {
//         case HttpMethod.get:
//           res = await getRequest(path, param, header);
//           break;
//         case HttpMethod.post:
//           res = await postRequest(path, param, header);
//           break;
//         case HttpMethod.put:
//           res = await putRequest(path, param, header);
//           break;
//         case HttpMethod.delete:
//           res = await deleteRequest(path, param, header);
//           break;
//       }
//       Logger logger = Logger();
//       logger.v('HTTP LOG responseHeader << $path ${res.headers}');
//       logger.v('HTTP LOG responseBody << $path ${utf8.decode(res.bodyBytes)}');
//
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<http.Response> getRequest(
//     String path,
//     Map<String, dynamic> param,
//     Map<String, String> header,
//   ) async {
//     final Uri uri = Uri(
//       scheme: env.kScheme,
//       host: env.kHost,
//       path: path,
//       queryParameters: param,
//     );
//
//     final http.Response response = await httpClient.get(uri);
//
//     if (response.statusCode != 200) {
//       throw httpErrorHandler(response);
//     }
//
//     final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
//
//     if (responseBody.isEmpty) {
//       throw RemoteException('빈 결과값');
//     }
//
//     return responseBody;
//   }
//
//   Future<http.Response> postRequest(
//     String path,
//     Map<String, dynamic> param,
//     Map<String, String> header,
//   ) async {
//     final Uri uri = Uri(
//       scheme: env.kScheme,
//       host: env.kHost,
//       path: path,
//       queryParameters: param,
//     );
//
//     final http.Response response = await httpClient.post(uri);
//
//     if (response.statusCode != 200) {
//       throw httpErrorHandler(response);
//     }
//
//     final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
//
//     if (responseBody.isEmpty) {
//       throw RemoteException('빈 결과값');
//     }
//
//     return responseBody;
//   }
//
//   Future<http.Response> putRequest(
//     String path,
//     Map<String, dynamic> param,
//     Map<String, String> header,
//   ) async {
//     final Uri uri = Uri(
//       scheme: env.kScheme,
//       host: env.kHost,
//       path: path,
//       queryParameters: param,
//     );
//
//     final http.Response response = await httpClient.put(uri);
//
//     if (response.statusCode != 200) {
//       throw httpErrorHandler(response);
//     }
//
//     final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
//
//     if (responseBody.isEmpty) {
//       throw RemoteException('빈 결과값');
//     }
//
//     return responseBody;
//   }
//
//   Future<http.Response> deleteRequest(
//     String path,
//     Map<String, dynamic> param,
//     Map<String, String> header,
//   ) async {
//     final Uri uri = Uri(
//       scheme: env.kScheme,
//       host: env.kHost,
//       path: path,
//       queryParameters: param,
//     );
//
//     final http.Response response = await httpClient.delete(uri);
//
//     if (response.statusCode != 200) {
//       throw httpErrorHandler(response);
//     }
//
//     final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
//
//     if (responseBody.isEmpty) {
//       throw RemoteException('빈 결과값');
//     }
//
//     return responseBody;
//   }
// }
