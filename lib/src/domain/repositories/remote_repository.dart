import 'package:quran_ai/src/domain/models/responses/all_surahs_response.dart';
import 'package:quran_ai/src/domain/models/responses/single_surah_response.dart';
import 'package:quran_ai/src/domain/models/responses/specific_juz_response.dart';
import 'package:quran_ai/src/utils/resources/data_state.dart';

abstract class RemoteRepository {
  Future<DataState<AllSurahsResponse>> getAllSurahs();
  Future<DataState<SpecificJuzResponse>> getJuzByNumber(int juz);
  Future<DataState<SingleSurahResponse>> getSingleSurah(int surahIndex);
}
