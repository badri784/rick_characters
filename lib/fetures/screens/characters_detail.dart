import 'package:flutter/material.dart';
import 'package:rick_characters/fetures/widget/character_detail_card.dart';
import 'package:rick_characters/fetures/widget/sliver_app_bar_detail_screen.dart';
import '../../core/helpers/height.dart';
import '../../core/models/result/results.dart';
import '../../core/theming/colors.dart';

class CharactersDetailScreen extends StatelessWidget {
  final Results character;
  const CharactersDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.gray,
      body: CustomScrollView(
        slivers: [
          SliverAppBarDetailScreen(character: character),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: CharactersDetialCard(character: character),
              ),
              verticalSpace(700),
            ]),
          ),
        ],
      ),
    );
  }
}
