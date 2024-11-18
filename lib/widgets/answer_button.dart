import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue),
          child: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }
}
