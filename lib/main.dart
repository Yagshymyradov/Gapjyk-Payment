import 'package:flutter/material.dart';

import 'screens/auth/auth.dart';
import 'utils/theme.dart';

void main() {
  runApp(const GapjykPaymentApp());
}

class GapjykPaymentApp extends StatelessWidget {
  const GapjykPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Auth(),
    );
  }
}
