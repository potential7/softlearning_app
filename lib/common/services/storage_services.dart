import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;
  Future<StorageServices>  init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}