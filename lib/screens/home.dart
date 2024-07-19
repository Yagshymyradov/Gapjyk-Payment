import 'package:flutter/material.dart';

import '../components/field_text.dart';
import '../utils/assets.dart';
import '../utils/navigation.dart';
import '../utils/theme.dart';
import 'choose_payment.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppIcons.gapjykLogo.svgPicture(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FieldText(
              hintText: 'Tölenmeli belgi',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => navigateToScreen(
                context,
                const ChoosePayment(),
              ),
              child: Text(
                'Next',
                style: textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
