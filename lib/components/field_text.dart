import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldText extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const FieldText({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final displayMediumText = Theme.of(context).textTheme.bodyMedium;
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      style: displayMediumText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
      ),
    );
  }
}
