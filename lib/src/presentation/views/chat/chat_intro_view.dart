import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/data/data_sources/local/hive/storage_service.dart';

class ChatIntroScreen extends StatefulWidget {
  const ChatIntroScreen({super.key});

  static String routeName = '/chatIntroScreen';

  @override
  State<ChatIntroScreen> createState() => _ChatIntroScreenState();
}

class _ChatIntroScreenState extends State<ChatIntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -3.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: size.height / 1.8,
            child: SlideTransition(
              position: _slideAnimation,
              child: CircleAvatar(
                radius: size.height / 3,
                backgroundColor: AppColors.xF8F8F8,
              ),
            ),
          ),
          Positioned(
            top: kToolbarHeight * 1.2,
            left: 16,
            child: IconButton(
              onPressed: () {
                StorageService.instance.setChatIntroStatus(true).then(
                  (_) {
                    if (!context.mounted) return;
                    context.pop();
                  },
                );
              },
              icon: const Icon(
                Icons.close_rounded,
                color: AppColors.x808486,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SlideTransition(
                  position: _slideAnimation,
                  child: SvgPicture.asset("assets/svg/ic_chat.svg"),
                ),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          left: 38,
                          right: 38,
                        ),
                        child: Text(
                          "Hi, I am your personal AI bot, called QuranGPT",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s20w500.copyWith(
                            color: AppColors.x000000,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 38,
                          vertical: 12,
                        ),
                        child: Text(
                          'I am here to make your Quran learning and memorizing journey easier and help you with your questions',
                          style: AppTextStyles.s14w400.copyWith(
                            color: AppColors.x838383,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          StorageService.instance.setChatIntroStatus(true).then(
                            (_) {
                              if (!context.mounted) return;
                              context.pop();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.x004B40.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          'Start the chat',
                          style: AppTextStyles.s15w600.copyWith(
                            color: AppColors.xFFFFFF,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
