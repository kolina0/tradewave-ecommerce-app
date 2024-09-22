import 'dart:async';

import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        signInEmailScreen,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(ImagesManager.logo),
      ),
    );
  }
}
