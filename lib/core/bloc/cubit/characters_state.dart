part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Results> characters;
  CharactersLoaded(this.characters);
}

class CharactersLoading extends CharactersState {}

class CharactersError extends CharactersState {
  final String error;
  CharactersError(this.error);
}
