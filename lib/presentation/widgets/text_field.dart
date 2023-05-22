import 'package:flutter/material.dart';

class RTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  TextEditingController? controller;
  Widget? prefixIcon;
  RTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
  });

  @override
  State<RTextField> createState() => _RTextFieldState();
}

class _RTextFieldState extends State<RTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        border: Border.all(color: Colors.blue),
      ),
      child: TextField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.label,
          border: InputBorder.none,
        ),
        controller: widget.controller,
      ),
    );
  }
}
