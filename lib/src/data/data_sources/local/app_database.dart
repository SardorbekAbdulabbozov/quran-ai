import 'package:quran_ai/src/domain/models/surah.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'dao/surah_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Surah])
abstract class AppDatabase extends FloorDatabase {
  SurahDao get surahDao;
}
