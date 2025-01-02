import 'package:quran_ai/src/data/data_sources/local/app_database.dart';
import 'package:quran_ai/src/data/data_sources/local/hive/storage_service.dart';
import 'package:quran_ai/src/data/data_sources/remote/quran_api_service.dart';
import 'package:quran_ai/src/data/repositories/database_repository_impl.dart';
import 'package:quran_ai/src/data/repositories/remote_repository_impl.dart';
import 'package:quran_ai/src/domain/repositories/database_repository.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';
import 'package:quran_ai/src/utils/constants/strings.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<StorageService>(await StorageService.init());

  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );

  locator.registerLazySingleton<QuranApiService>(
    () => QuranApiService(locator<Dio>()),
  );

  locator.registerLazySingleton<RemoteRepository>(
    () => RemoteRepositoryImpl(locator<QuranApiService>()),
  );
}
