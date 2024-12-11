import 'package:quran_ai/src/domain/models/surah.dart';

abstract class DatabaseRepository {
  Future<List<Surah>> getSavedSurahs();

  Future<void> saveSurah(Surah surah);

  Future<void> removeSurah(Surah surah);
}