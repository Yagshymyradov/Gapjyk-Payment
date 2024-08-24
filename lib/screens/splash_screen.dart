import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../utils/assets.dart';
import '../utils/navigation.dart';
import 'auth/auth.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this);

  void replaceWithRootScreen() {
    final authState =
        ProviderScope.containerOf(context, listen: false).read(authControllerProvider);
    if (authState != null) {
      replaceRootScreen(context, const Home());
    } else {
      replaceRootScreen(context, const Auth());
    }
  }

  @override
  void initState() {
    super.initState();

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        replaceWithRootScreen();
      }
    });

    animController
      ..duration = const Duration(seconds: 3)
      ..forward();
  }

  @override
  void dispose() {
    animController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppIcons.gapjykLogo.svgPicture(),
      ),
    );
  }
}
