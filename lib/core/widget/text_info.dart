import 'package:flutter/material.dart';
import '../theming/colors.dart';

class TextInfo extends StatelessWidget {
  final String? text;
  final String? value;
  const TextInfo({super.key, this.text, this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              fontSize: 18,
              color: ColorsManger.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextSpan(
            text: value,
            style: const TextStyle(fontSize: 15, color: ColorsManger.white),
          ),
        ],
      ),
    );
  }
}
