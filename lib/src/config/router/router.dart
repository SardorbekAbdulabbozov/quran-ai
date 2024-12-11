import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';
import 'package:quran_ai/src/locator.dart';
import 'package:quran_ai/src/presentation/blocs/home/home_bloc.dart';
import 'package:quran_ai/src/presentation/blocs/surah/surah_bloc.dart';
import 'package:quran_ai/src/presentation/views/home/home_screen.dart';
import 'package:quran_ai/src/presentation/views/no_internet/no_internet_screen.dart';
import 'package:quran_ai/src/presentation/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quran_ai/src/presentation/views/surah/surah_screen.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final rootKey = GlobalKey<NavigatorState>();

final Chuck chuck = Chuck(
  navigatorKey: rootKey,
  showNotification: false,
  showInspectorOnShake: false,
  darkTheme: false,
);

final GoRouter router = GoRouter(
  navigatorKey: rootKey,
  initialLocation: SplashScreen.routeName,
  observers: [GoRouterObserver()],
  routes: <RouteBase>[
    /// splash
    GoRoute(
      path: SplashScreen.routeName,
      name: SplashScreen.routeName,
      parentNavigatorKey: rootKey,
      builder: (context, state) => const SplashScreen(),
    ),

    /// no internet
    GoRoute(
      name: NoInternetScreen.routeName,
      path: NoInternetScreen.routeName,
      parentNavigatorKey: rootKey,
      builder: (context, state) => const NoInternetScreen(),
    ),

    /// home
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                HomeBloc(locator.get<RemoteRepository>())..add(GetAllSurahs()),
          ),
        ],
        child: const HomeScreen(),
      ),
    ),

    /// surah
    GoRoute(
      name: SurahScreen.routeName,
      path: SurahScreen.routeName,
      builder: (context, state) => BlocProvider(
        create: (_) => SurahBloc(locator.get<RemoteRepository>())
          ..add(
            GetSingleSurah(
              surahIndex: int.parse(
                state.extra is Map
                    ? ((state.extra as Map)['surahIndex'] ?? '0')
                    : '0',
              ),
            ),
          ),
        child: SurahScreen(
          surahIndex: state.extra is Map
              ? ((state.extra as Map)['surahIndex'] ?? '0')
              : '0',
          surahName: state.extra is Map
              ? ((state.extra as Map)['surahName'] ?? '')
              : '',
        ),
      ),
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('GoRouterObserver didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('GoRouterObserver didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('GoRouterObserver didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('GoRouterObserver didReplace: $newRoute');
  }
}
