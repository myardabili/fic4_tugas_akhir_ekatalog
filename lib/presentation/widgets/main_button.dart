import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String label;
  Function()? onPressed;
  MainButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.blue[300],
        ),
        onPressed: () {
          widget.onPressed;
        },
        child: Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
