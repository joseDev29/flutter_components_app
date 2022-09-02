import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? counterText;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    Key? key,
    required this.formProperty,
    required this.formValues,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.helperText,
    this.counterText,
    this.icon,
    this.prefixIcon,
    this.sufixIcon,
    this.keyboardType,
  }) : //obscureText = obsureText ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      // initialValue: 'Eren Jeager',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (value == null) return 'Required value';
        if (value.length < 5) {
          return 'Value length min is 5 characters';
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: formValues[formProperty],
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: counterText,
        icon: Icon(icon),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(sufixIcon),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.purple,
        //   ),
        // ),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(16),
        //     bottomLeft: Radius.circular(16),
        //   ),
        // ),
      ),
    );
  }
}
