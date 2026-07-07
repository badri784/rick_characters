import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_characters/core/theming/colors.dart';
import '../../core/bloc/cubit/characters_cubit.dart';
import 'characters_grid.dart';
// import 'characters_loading.dart';

class CharactersBody extends StatefulWidget {
  const CharactersBody({super.key});

  @override
  State<CharactersBody> createState() => _CharactersBodyState();
}

class _CharactersBodyState extends State<CharactersBody> {
  // int page = 1;
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<CharactersCubit>().getCharacters(page);
  // }'
  @override
  void initState() {
    super.initState();
    context.read<CharactersCubit>().getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                context.read<CharactersCubit>().getAllCharacters();
              }
              return true;
            },
            child: CharactersGrid(characters: state.characters),
          );
        }
        // else if (state is CharactersLoading) {
        //   return const CharactersLoadingWidget();
        // }
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            size: 50,
            color: ColorsManger.white,
          ),
        );
      },
    );
  }
}
