import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/presentation/views/home/home_screen.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  static const routeName = '/noInternetScreen';

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen(
      (event) {
        if (event == InternetConnectionStatus.connected) {
          if (!mounted) return;
          context.go(HomeScreen.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            const Text('Internet bilan aloqa uzildi ('),
            ElevatedButton(
              onPressed: () async {
                bool result = await InternetConnectionChecker().hasConnection;
                if (!result) {
                } else {
                  if (context.mounted) {
                    context.go(HomeScreen.routeName);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.assets,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Internetga ulanishni tekshirish',
              ),
            )
          ],
        ),
      ),
    );
  }
}
