import 'package:flutter/material.dart';

import '../../core/theming/colors.dart';

class FeiledData extends StatelessWidget {
  const FeiledData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Feild To Get Data ',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorsManger.white,
        ),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}
