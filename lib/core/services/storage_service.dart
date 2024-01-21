import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._privateConstructor();
  factory StorageService() {
    return _instance;
  }
  late SharedPreferences _prefs;

  StorageService._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) => _prefs = prefs);
  }

  // get data from local
  Object? getData(String key) {
    final result = _prefs.get(key);
    return result;
  }

  // set a boolean value in local
  Future<void> setBool(String key, bool data) async {
    await _prefs.setBool(key, data);
  }

  // delete data from local
  Future<void> deleteData(String key) async {
    await _prefs.remove(key);
  }
}
