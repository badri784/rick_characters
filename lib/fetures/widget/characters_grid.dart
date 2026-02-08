import 'package:flutter/material.dart';

import '../../core/models/result/results.dart';
import 'character_item.dart';

class CharactersGrid extends StatelessWidget {
  final List<Results> characters;

  const CharactersGrid({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: characters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 8 / 9,
        // mainAxisSpacing: ,
        crossAxisSpacing: 4,
        mainAxisExtent: 400,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CharacterItem(character: characters[index]);
      },
    );
  }
}
