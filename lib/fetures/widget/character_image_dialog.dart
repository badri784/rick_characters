import 'package:flutter/material.dart';
import 'package:rick_characters/core/widget/custom_cached_network_image.dart';
import 'package:rick_characters/core/models/result/results.dart';
import 'package:rick_characters/core/theming/colors.dart';

class CharacterImageDialog extends StatelessWidget {
  const CharacterImageDialog({super.key, required this.character});

  final Results character;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id!,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              backgroundColor: ColorsManger.black,
              child: InteractiveViewer(
                trackpadScrollCausesScale: true,
                child: CustomCachedNetworkImage(
                  imageUrl: character.image!,
                  fit: BoxFit.contain,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          );
        },
        child: CustomCachedNetworkImage(
          imageUrl: character.image!,
        ),
      ),
    );
  }
}
