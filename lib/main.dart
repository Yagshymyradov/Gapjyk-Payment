import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/auth/auth.dart';
import 'utils/navigation.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    const ProviderScope(child: GapjykPaymentApp()),
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
      home: const Auth(),
    );
  }
}
