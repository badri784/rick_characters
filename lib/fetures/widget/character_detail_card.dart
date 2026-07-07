import 'package:flutter/material.dart';
import 'package:rick_characters/core/helpers/height.dart';
import 'package:rick_characters/core/models/result/results.dart';
import 'package:rick_characters/core/theming/colors.dart';
import 'package:rick_characters/core/theming/textstyle.dart';
import 'package:rick_characters/core/widget/character_detail_card.dart';

class CharactersDetialCard extends StatelessWidget {
  const CharactersDetialCard({super.key, required this.character});

  final Results character;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharacterDetailCard(
          title: Text('Gender ', style: Textstyles.font14TextGray),
          subtitle: Text(character.gender!, style: Textstyles.font16white),
          trailing: CircleAvatar(
            backgroundImage: character.gender == 'Male'
                ? AssetImage('assets/images/male_image.webp')
                : character.gender == 'Female'
                ? AssetImage('assets/images/female.webp')
                : AssetImage('assets/images/unknown.jpg'),
          ),
        ),
        verticalSpace(6),
        CharacterDetailCard(
          title: Text('Origin :', style: Textstyles.font14TextGray),
          subtitle: Text(character.origin!.name, style: Textstyles.font16white),
          leading: Icon(Icons.language, color: ColorsManger.white),
        ),
        verticalSpace(6),
        CharacterDetailCard(
          title: Text('Last Know Location :', style: Textstyles.font14TextGray),
          subtitle: Text(
            character.location!.name!,
            style: Textstyles.font16white,
          ),
        ),
        verticalSpace(6),
        CharacterDetailCard(
          title: Text('Episode Count :', style: Textstyles.font14TextGray),
          subtitle: Text(
            character.episode!.length.toString(),
            style: Textstyles.font16white,
          ),
        ),
      ],
    );
  }
}
