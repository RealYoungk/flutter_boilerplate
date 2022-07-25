import 'package:flutter/widgets.dart';
import 'package:kick_admin/src/data/data.dart';
import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(
    AdminRepositoryRemote(HttpRemoteDataSource()),
  );
}
