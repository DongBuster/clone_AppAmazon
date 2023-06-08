import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final double width;
  final double height;
  final String? Function(String?) validator;
  final bool? passwordVisible;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final Color fillColor;
  final Color cursorColor;
  final BorderRadius borderRadius;
  const InputField({
    super.key,
    required this.width,
    required this.height,
    required this.validator,
    required this.passwordVisible,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.fillColor,
    required this.cursorColor,
    required this.borderRadius,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        validator: widget.validator,
        cursorColor: widget.cursorColor,
        obscureText: widget.passwordVisible ?? false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius,
          ),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: widget.fillColor,
        ),
      ),
    );
  }
}
