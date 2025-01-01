import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';

class LoadingBuilder extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingBuilder({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [AppColors.x004B40],
                strokeWidth: 2,
                backgroundColor: Colors.transparent,
                pathBackgroundColor: Colors.black,
              ),
            ),
          )
        : child;
  }
}
