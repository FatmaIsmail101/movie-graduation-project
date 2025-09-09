import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating, // makes it float above UI
    duration: const Duration(seconds: 3), // control duration
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    content: Row(
      children: [
        Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
