import 'package:flutter/material.dart';

class BuildNoInternetConnetion extends StatelessWidget {
  const BuildNoInternetConnetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/image.png'),
            ),
          ),
        ],
      ),
    );
  }
}
