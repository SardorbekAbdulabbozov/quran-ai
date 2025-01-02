// ignore_for_file: deprecated_member_use

import 'package:go_router/go_router.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/data/data_sources/local/hive/storage_service.dart';
import 'package:quran_ai/src/presentation/blocs/main/main_bloc.dart';
import 'package:quran_ai/src/presentation/views/chat/chat_intro_view.dart';
import 'package:quran_ai/src/presentation/views/chat/chat_view.dart';
import 'package:quran_ai/src/presentation/views/home/home_view.dart';
import 'package:quran_ai/src/presentation/views/profile/profile_view.dart';
import 'package:quran_ai/src/presentation/views/quran/quran_view.dart';
import 'package:quran_ai/src/utils/components/loading_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_ai/src/utils/constants/strings.dart';
import 'package:quran_ai/src/utils/resources/icon/app_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String routeName = '/mainScreen';

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              appName,
              style: AppTextStyles.s20w700,
            ),
            bottom: state.index == 1
                ? null
                : PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Divider(
                      height: 0,
                      color: AppColors.x000000.withOpacity(0.1),
                    ),
                  ),
          ),
          body: LoadingBuilder(
            isLoading: state.isLoading,
            child: IndexedStack(
              index: state.index,
              children: const [
                HomeView(),
                QuranView(),
                ChatView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                height: 0,
                color: AppColors.x000000.withOpacity(0.1),
              ),
              BottomNavigationBar(
                currentIndex: state.index,
                onTap: (index) {
                  if (!StorageService.instance.isChatIntroShown() &&
                      index == 2) {
                    context.pushNamed(ChatIntroScreen.routeName);
                  }
                  bloc.add(ChangeIndex(index));
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.xFFFFFF,
                selectedItemColor: AppColors.x004B40,
                unselectedItemColor: AppColors.xA7A7A7,
                type: BottomNavigationBarType.fixed,
                unselectedIconTheme: const IconThemeData(size: 32),
                selectedIconTheme: const IconThemeData(size: 32),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(App.kaaba),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(App.quran),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(App.ai),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(App.profileRounded, size: 28),
                    label: '',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
