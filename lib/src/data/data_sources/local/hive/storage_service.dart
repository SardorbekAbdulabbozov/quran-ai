import 'package:hive/hive.dart';
import 'package:quran_ai/src/utils/constants/keys.dart';

class StorageService {
  late Box _box;

  static StorageService? _instance;

  static StorageService get instance => _instance!;

  static Future<StorageService> init() async {
    _instance = StorageService();
    _instance!._box = await Hive.openBox('quran-ai');
    return _instance!;
  }

  Future<void> clearStorage() async {
    await _box.clear();
  }

  Future<void> setChatIntroStatus(bool status) async {
    await _box.put(Keys.chatIntroStatus, status);
  }

  bool isChatIntroShown() {
    return _box.get(Keys.chatIntroStatus, defaultValue: false) ?? false;
  }
}
