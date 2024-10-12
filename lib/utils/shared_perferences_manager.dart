import 'package:shared_preferences/shared_preferences.dart';

class SharedPerferencesManager {
  SharedPreferences? _preferences;
  SharedPerferencesManager._();

  static final SharedPerferencesManager _instance =
      SharedPerferencesManager._();

  factory SharedPerferencesManager() {
    return _instance;
  }

  Future <void> init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key , String value)async{
      await _preferences?.setString(key,value);
  }

  Future<void> saveInt(String key , int value)async{
      await _preferences?.setInt(key,value);
  }

  Future<void> saveBool(String key , bool value)async{
      await _preferences?.setBool(key,value);
  }

  String? getstring(String key){
    return _preferences?.getString(key);
  }

  int? getInt(String key){
    return _preferences?.getInt(key);
  }

  bool? getBool(String key){
    return _preferences?.getBool(key);
  }
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }
}
