import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  Future<bool> getIntroState() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getBool('intro') ?? false;
  }
  Future<void> saveIntroState(bool state) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool('intro', state);
  }
}