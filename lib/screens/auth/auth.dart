import 'package:flutter/material.dart';

import '../../components/field_text.dart';
import '../../utils/assets.dart';
import '../../utils/navigation.dart';
import '../../utils/theme.dart';
import '../../utils/validators.dart';
import '../home.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Center(
                child: AppIcons.gapjykLogo.svgPicture(),
              ),
              const SizedBox(height: 70),
              const Text('Ulanyjy ady*'),
              const SizedBox(height: 8),
              FieldText(
                controller: nameController,
                hintText: 'Adyňyzy giriziň',
                validator: (value) => Validator.emptyField(context, value),
              ),
              const SizedBox(height: 20),
              const Text('Açar sözi*'),
              const SizedBox(height: 8),
              FieldText(
                controller: passwordController,
                hintText: 'Açar sözi giriziň',
                validator: (value) => Validator.emptyField(context, value),
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                onPressed: () => replaceRootScreen(
                  context,
                  const Home(),
                ),
                child: Text(
                  'Içeri gir',
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
