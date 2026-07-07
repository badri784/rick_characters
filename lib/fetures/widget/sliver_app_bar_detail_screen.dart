import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rick_characters/core/models/result/results.dart';
import 'package:rick_characters/core/theming/colors.dart';
import 'package:rick_characters/fetures/widget/character_image_dialog.dart';

class SliverAppBarDetailScreen extends StatelessWidget {
  const SliverAppBarDetailScreen({super.key, required this.character});

  final Results character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 650,
      pinned: true,
      stretch: true,
      backgroundColor: ColorsManger.gray,
      flexibleSpace: FlexibleSpaceBar(
        title: DefaultTextStyle(
          style: const TextStyle(
            color: ColorsManger.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
          child: AnimatedTextKit(
            // repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                character.name!,
                curve: Curves.easeInOut,
                speed: const Duration(milliseconds: 150),
              ),
            ],
          ),
        ),
        background: CharacterImageDialog(character: character),
      ),
    );
  }
}
