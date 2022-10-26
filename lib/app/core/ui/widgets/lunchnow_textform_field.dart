import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';

class LunchnowTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  LunchnowTextFormField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.controller,
      this.validator})
      : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), gapPadding: 0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Colors.red)),
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: Icon(
                        obscureTextVNValue
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: context.primaryColor,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}
