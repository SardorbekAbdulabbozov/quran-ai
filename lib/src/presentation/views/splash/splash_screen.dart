import 'package:flutter/material.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_ai/src/presentation/views/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!mounted) return;
        context.go(HomeScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: AppColors.assets);
  }
}
