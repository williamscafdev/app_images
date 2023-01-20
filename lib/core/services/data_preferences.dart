import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _userTypeKey = 'userType';

@lazySingleton
class DataPreferences {
  late SharedPreferences _prefs;
  Future<DataPreferences> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String get userType => _prefs.getString(_userTypeKey) ?? '';
  set userType(String value) => _prefs.setString(_userTypeKey, value);
}
