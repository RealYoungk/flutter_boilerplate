enum LocalMethod { setString, getString }

abstract class LocalDataSource {
  String? getString({String key});

  Future<void> setString({String key, String value});
}
