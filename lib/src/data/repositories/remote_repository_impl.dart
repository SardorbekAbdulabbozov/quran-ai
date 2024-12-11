import 'package:quran_ai/src/data/data_sources/remote/quran_api_service.dart';
import 'package:quran_ai/src/data/repositories/base/base_remote_repository.dart';
import 'package:quran_ai/src/domain/models/responses/all_surahs_response.dart';
import 'package:quran_ai/src/domain/models/responses/single_surah_response.dart';
import 'package:quran_ai/src/domain/models/responses/specific_juz_response.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';
import 'package:quran_ai/src/utils/constants/strings.dart';
import 'package:quran_ai/src/utils/resources/data_state.dart';

class RemoteRepositoryImpl extends BaseRemoteRepository
    implements RemoteRepository {
  final QuranApiService _quranApiService;

  RemoteRepositoryImpl(this._quranApiService);

  @override
  Future<DataState<AllSurahsResponse>> getAllSurahs() {
    return getStateOf<AllSurahsResponse>(
      request: () => _quranApiService.getAllSurahs(),
    );
  }

  @override
  Future<DataState<SpecificJuzResponse>> getJuzByNumber(int juz) {
    return getStateOf<SpecificJuzResponse>(
      request: () => _quranApiService.getJuzByNumber(juz, defaultEdition),
    );
  }

  @override
  Future<DataState<SingleSurahResponse>> getSingleSurah(int surahIndex) {
    return getStateOf<SingleSurahResponse>(
      request: () => _quranApiService.getSingleSurah(surahIndex),
    );
  }
}
