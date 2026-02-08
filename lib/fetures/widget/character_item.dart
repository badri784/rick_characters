import 'package:flutter/material.dart';
import 'package:rick_characters/core/helpers/height.dart';

import '../../core/helpers/strings.dart';
import '../../core/models/result/results.dart';
import '../../core/theming/colors.dart';

class CharacterItem extends StatelessWidget {
  final Results character;

  const CharacterItem({super.key, required this.character});
  // Widget MangeColorsDeadOrLive (){
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 14, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: ColorsManger.white),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, charactersDetail, arguments: character);
        },
        child: GridTile(
          header: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: ColorsManger.black),
                  color: character.status == 'Alive'
                      ? ColorsManger.green
                      : character.status == 'Dead'
                      ? ColorsManger.red
                      : ColorsManger.gray,
                  shape: BoxShape.circle,
                ),
                height: 14,
                width: 14,
              ),
            ),
          ),
          footer: Container(
            color: ColorsManger.gray,
            height: 85,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            // alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name!,
                  style: const TextStyle(
                    color: ColorsManger.white,
                    fontSize: 16,
                  ),
                  // textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: character.status == 'Alive'
                            ? ColorsManger.green
                            : character.status == 'Dead'
                            ? ColorsManger.red
                            : ColorsManger.gray,
                        shape: BoxShape.circle,
                      ),
                      height: 12,
                      width: 12,
                    ),
                    horizentealSpace(6),
                    Text(
                      character.status!,
                      style: TextStyle(
                        color: ColorsManger.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Text(
                  character.species!,
                  style: TextStyle(
                    color: ColorsManger.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          child: Hero(
            tag: character.id!,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading_gray.gif',
              image: character.image!,
              fit: BoxFit.cover,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
