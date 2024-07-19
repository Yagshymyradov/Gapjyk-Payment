import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/enums.dart';
import '../utils/theme.dart';

class ChoosePayment extends StatefulWidget {
  const ChoosePayment({super.key});

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  SubscriptionMonth selectedMonth = SubscriptionMonth.one;

  void onSelectedMonth(SubscriptionMonth? value) {
    if (value != null) {
      selectedMonth = value;
      setState(() {
        //no-op
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: AppIcons.gapjykLogo.svgPicture(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...SubscriptionMonth.values.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RadioListTile(
                  activeColor: AppColors.greenColor,
                  value: e,
                  groupValue: selectedMonth,
                  onChanged: onSelectedMonth,
                  title: Text(
                    e.asTitle,
                    style: textTheme.titleSmall,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.greenColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Tölemek',
                style: textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
