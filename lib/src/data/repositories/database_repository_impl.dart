import 'package:quran_ai/src/data/data_sources/local/app_database.dart';
import 'package:quran_ai/src/domain/models/surah.dart';
import 'package:quran_ai/src/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Surah>> getSavedSurahs() async {
    return _appDatabase.surahDao.getAllSurahs();
  }

  @override
  Future<void> removeSurah(Surah surah) async {
    return _appDatabase.surahDao.deleteSurah(surah);
  }

  @override
  Future<void> saveSurah(Surah surah) async {
    return _appDatabase.surahDao.insertSurah(surah);
  }
}