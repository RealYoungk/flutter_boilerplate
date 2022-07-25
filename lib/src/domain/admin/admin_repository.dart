import 'package:kick_admin/src/data/source/remote_data_source.dart';

import 'admin.dart';

abstract class AdminRepository {
  RemoteDataSource dataSource;

  AdminRepository(this.dataSource);

  Future<AdminModel> signup(Map<String, dynamic> param);

  Future<AdminModel> signout(Map<String, dynamic> param);

  Future<AdminModel> signin(Map<String, dynamic> param);

  Future<AdminModel> delete(Map<String, dynamic> param);
}
