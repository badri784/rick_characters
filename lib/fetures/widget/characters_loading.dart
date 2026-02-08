import 'package:flutter/material.dart';

class CharactersLoadingWidget extends StatelessWidget {
  const CharactersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loading_gray.gif',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),

          const Text('Feaching Data', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
