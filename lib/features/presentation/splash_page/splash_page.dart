import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_enums.dart';
import 'package:invesier/features/data/providers/localization_provider.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/extension/extension.dart';
import '../../../core/router/router.dart';
import '../../data/providers/provider.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  Future<void> splash() async {
    await Future.delayed(Duration(seconds: 3), () {
      final prefs = ref.read(prefsProvider);
      final token = prefs.getString(AppStrings.userToken);
      final isSaved = prefs.getBool(AppStrings.skipOnboarding) ?? false;
      prefs.getString("isSavedLocal");

      ref
          .read(localizationProvider.notifier)
          .localiztation(Localization.initial);
      if (token != null) {
        context.router.replace(MainNavigationRoute());
        return;
      }
      if (isSaved) {
        context.router.replace(WelcomeRoute());
      } else {
        context.router.replace(OnboardingRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.kLogo,
              width: context.width * 0.6,
              height: context.height * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
