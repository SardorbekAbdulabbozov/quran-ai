import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/utils/resources/icon/app_icons.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  PackageInfo? packageInfo;
  List<ProfileItem> profileItems = [
    ProfileItem(title: "Theme", icon: App.brightness),
    ProfileItem(title: "Privacy", icon: App.lock),
    ProfileItem(title: "Language", icon: App.globe),
    ProfileItem(title: "Help & Support", icon: App.headphones),
    ProfileItem(title: "Push Notifications", icon: App.notification),
    ProfileItem(title: "Clean-up space", icon: App.trash),
  ];

  void checkAndSetVersion() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkAndSetVersion();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.xF0F0F0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.xFFFFFF,
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.xF4F4F4,
                    ),
                    child: const Icon(
                      App.muslimManPraying,
                      size: 32,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Sardorbek Abdulabbozov',
                          style: AppTextStyles.s16w500.copyWith(
                            color: AppColors.x000000,
                          ),
                        ),
                      ),
                      Text(
                        'Hafiz al-Quran, InshaAllah',
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.x838383,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.xFFFFFF,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  final item = profileItems[i];
                  return GestureDetector(
                    onTap: item.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Icon(
                                  item.icon,
                                  size: 24,
                                  color: AppColors.xA7A7A7,
                                ),
                              ),
                              Text(
                                item.title,
                                style: AppTextStyles.s16w500.copyWith(
                                  color: AppColors.x000000,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: AppColors.xA7A7A7,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, i) => const Divider(
                  height: 0,
                  color: AppColors.xF4F4F4,
                ),
                itemCount: profileItems.length,
              ),
            ),
            const Spacer(),
            if (packageInfo != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Version: ${packageInfo!.version} (${packageInfo!.buildNumber})",
                  style: AppTextStyles.s14w400.copyWith(
                    color: AppColors.x000000,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem {
  final void Function()? onTap;
  final String title;
  final IconData icon;

  ProfileItem({
    required this.title,
    required this.icon,
    this.onTap,
  });
}
