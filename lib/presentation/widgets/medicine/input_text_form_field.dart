import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? erroMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const InputTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.erroMessage,
      this.obscureText = false,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        //borderSide: BorderSide(color: colors.primary),//Este ccodigo es para darle color a todos los inputs
        borderRadius: BorderRadius.circular(30));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,

        errorText: erroMessage, //'Este es el error text'
        // prefixIcon: Icon(
        //   Icons.supervised_user_circle_outlined,
        //   color: colors.primary,
        // )
      ),
    );
  }
}
