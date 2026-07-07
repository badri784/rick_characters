import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_characters/core/bloc/cubit/characters_cubit.dart';
import 'package:rick_characters/core/theming/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({required this.editingController, super.key});
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorsManger.gray,
      controller: editingController,
      autofocus: true,
      style: const TextStyle(color: ColorsManger.gray, fontSize: 18),
      decoration: const InputDecoration(
        hintText: 'Find a Character...',
        hintStyle: TextStyle(color: ColorsManger.gray),
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      onChanged: (searchCharacter) {
        context.read<CharactersCubit>().searchedList(searchCharacter);
      },
    );
  }
}
