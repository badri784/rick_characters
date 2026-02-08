import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rick_characters/core/theming/textstyle.dart';
import '../../core/helpers/height.dart';
import '../../core/models/result/results.dart';
import '../../core/theming/colors.dart';
import '../../core/widget/character_detail_card.dart';

class CharactersDetailScreen extends StatelessWidget {
  final Results character;
  const CharactersDetailScreen({super.key, required this.character});
  Widget _buildSliverAppBar(BuildContext context) {
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
                speed: const Duration(milliseconds: 70),
              ),
            ],
          ),
        ),
        background: Hero(
          tag: character.id!,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: ColorsManger.black,
                  child: InteractiveViewer(
                    trackpadScrollCausesScale: true,
                    child: Image.network(
                      character.image!,
                      fit: BoxFit.contain,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading_gray.gif',
              image: character.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.gray,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterDetailCard(
                      title: Text('Gender ', style: Textstyles.font14TextGray),
                      subtitle: Text(
                        character.gender!,
                        style: Textstyles.font16white,
                      ),
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
                      subtitle: Text(
                        character.origin!.name,
                        style: Textstyles.font16white,
                      ),
                      leading: Icon(Icons.language, color: ColorsManger.white),
                    ),
                    verticalSpace(6),
                    CharacterDetailCard(
                      title: Text(
                        'Last Know Location :',
                        style: Textstyles.font14TextGray,
                      ),
                      subtitle: Text(
                        character.location!.name!,
                        style: Textstyles.font16white,
                      ),
                    ),
                    verticalSpace(6),
                    CharacterDetailCard(
                      title: Text(
                        'Episode Count :',
                        style: Textstyles.font14TextGray,
                      ),
                      subtitle: Text(
                        character.episode!.length.toString(),
                        style: Textstyles.font16white,
                      ),
                    ),

                    // TextInfo(text: 'Gender : ', value: character.gender!),
                    // verticalSpace(4),
                    // TextInfo(text: 'status :q ', value: character.status!),
                    // verticalSpace(4),
                    // TextInfo(text: 'species : ', value: character.species!),
                    // verticalSpace(4),

                    // TextInfo(
                    //   text: 'type : ',
                    //   value: character.type!.isEmpty
                    //       ? 'unknown'
                    //       : character.type!,
                    // ),
                    // verticalSpace(4),
                    // TextInfo(text: 'created : ', value: character.created!),
                  ],
                ),
              ),
              verticalSpace(700),
            ]),
          ),
        ],
      ),
    );
  }
}
