import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/field_text.dart';
import '../utils/assets.dart';
import '../utils/navigation.dart';
import '../utils/theme.dart';
import '../utils/validators.dart';
import 'choose_payment.dart';
import 'profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  void onNextTap() {
    if (!formKey.currentState!.validate()) return;

    navigateToScreen(
      context,
      ChoosePayment(phone: phoneController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppIcons.gapjykLogo.svgPicture(),
        actions: [
          IconButton(
            onPressed: () => navigateToScreen(
              context,
              const Profile(),
            ),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FieldText(
                hintText: 'Tölenmeli belgi',
                controller: phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (phone) => Validator.phoneValidate(context, phone),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: onNextTap,
                child: Text(
                  'Dowam et',
                  style: textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
