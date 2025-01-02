import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quran_ai/src/config/router/router.dart';
import 'package:quran_ai/src/config/themes/app_theme.dart';
import 'package:quran_ai/src/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initializeDependencies();
  runApp(const QuranApp());
}

class QuranApp extends StatefulWidget {
  const QuranApp({super.key});

  @override
  State<QuranApp> createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quran AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
