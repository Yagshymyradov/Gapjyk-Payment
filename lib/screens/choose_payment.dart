import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/exceptions.dart';
import '../providers.dart';
import '../utils/enums.dart';
import '../utils/navigation.dart';
import '../utils/theme.dart';
import 'profile/profile.dart';

class ChoosePayment extends StatefulWidget {
  final String phone;

  const ChoosePayment({
    super.key,
    required this.phone,
  });

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  SubscriptionMonth selectedMonth = SubscriptionMonth.one;
  bool inProgress = false;

  void updateUi() {
    setState(() {
      //no-op
    });
  }

  void onSelectedMonth(SubscriptionMonth? value) {
    if (value != null) {
      selectedMonth = value;
      setState(() {
        //no-op
      });
    }
  }

  Future<void> onPaymentTap() async {
    inProgress = true;
    updateUi();

    final scope = ProviderScope.containerOf(context, listen: false);
    final apiClient = scope.read(apiClientProvider);

    try {
      await apiClient.subscription(
        widget.phone,
        selectedMonth.asSentValue,
      );
      if (mounted) {
        scope.refresh(profileProvider);
        Navigator.pop(context);
      }
    } catch (e) {
      if (e is HttpStatusException && e.code == 404) {
        final dataAsString = e.responseBody as String;
        final error = jsonDecode(dataAsString) as Map<String, dynamic>;
        showSnackBar(error['error'].toString());
      } else {
        showSnackBar('Ýalnyşlyk ýüze çykdy, täzden synanyşyň!');
      }
      log(e.toString());
    }

    inProgress = false;
    updateUi();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(),
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
              onPressed: () => inProgress ? null : onPaymentTap(),
              child: inProgress
                  ? const CircularProgressIndicator()
                  : Text(
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
