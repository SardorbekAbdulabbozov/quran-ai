import 'package:quran_ai/src/domain/models/surah.dart';
import 'package:quran_ai/src/utils/constants/strings.dart';
import 'package:floor/floor.dart';

@dao
abstract class SurahDao{
  @Query('SELECT * FROM $surahTableName')
  Future<List<Surah>> getAllSurahs();

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertSurah(Surah surah);

  @delete
  Future<void> deleteSurah(Surah surah);
}