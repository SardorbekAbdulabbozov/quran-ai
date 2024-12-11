import 'package:quran_ai/src/domain/models/responses/all_surahs_response.dart';
import 'package:quran_ai/src/domain/models/responses/single_surah_response.dart';
import 'package:quran_ai/src/domain/models/responses/specific_juz_response.dart';
import 'package:quran_ai/src/utils/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'quran_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class QuranApiService {
  factory QuranApiService(Dio dio, {String baseUrl}) = _QuranApiService;

  @GET('surah')
  Future<HttpResponse<AllSurahsResponse>> getAllSurahs();

  @GET('juz/{juz}/{edition}')
  Future<HttpResponse<SpecificJuzResponse>> getJuzByNumber(
    @Path('juz') int juz,
    @Path('edition') String edition,
  );

  @GET('surah/{surah}')
  Future<HttpResponse<SingleSurahResponse>> getSingleSurah(@Path('surah') int surahIndex);
}
