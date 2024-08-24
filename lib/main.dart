import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/services/preferences.dart';
import 'providers.dart';
import 'screens/auth/auth.dart';
import 'screens/splash_screen.dart';
import 'utils/navigation.dart';
import 'utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();
  final riverpodRootContainer = ProviderContainer(
    overrides: [
      appPrefsServiceProvider.overrideWithValue(AppPrefsService(sharedPrefs)),
    ],
  );

  final assembledContainer = riverpodRootContainer;

  runApp(
    ProviderScope(
      parent: assembledContainer,
      child: const GapjykPaymentApp(),
    ),
  );
}

class GapjykPaymentApp extends StatelessWidget {
  const GapjykPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: rootNavigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: const SplashScreen(),
    );
  }
}
