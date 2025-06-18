import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_internship/core/colors/colors.dart';
import 'package:flutter_internship/features/splash&onboarding/presentation/view/onBoarding_view.dart';
import '../../../auth/presentation/widgets/main_image.dart';
import '../../../../main.dart';
import '../../../home/presentation/view/home_view.dart';

class SPlashView extends StatefulWidget {
  const SPlashView({super.key});

  @override
  State<SPlashView> createState() => _SPlashViewState();
}

class _SPlashViewState extends State<SPlashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
          () {
        final isLoggedIn = userLocalStorage.isLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OnBoardingView()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.light,
      body: MainImage(width: 336, height: 336),
    );
  }
}
