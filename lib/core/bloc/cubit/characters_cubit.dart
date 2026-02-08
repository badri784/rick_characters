import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/result/results.dart';
import '../../networking/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());
  final CharactersRepo charactersRepo;
  final List<Results> _allCharacters = [];
  int currentPage = 1;
  bool isLoading = false;

  void getAllCharacters() async {
    if (isLoading) return;
    isLoading = true;

    final charactersBack = await charactersRepo.getCharacters(currentPage);
    _allCharacters.addAll(charactersBack.characters!);
    emit(CharactersLoaded(_allCharacters));
    currentPage++;
    isLoading = false;
  }

  // void getCharacters(int page) async {
  //   final response = await charactersRepo.getCharacters(page);
  //   _allCharacters.addAll(response.characters!);
  //   emit(CharactersLoaded(_allCharacters));
  //   currentPage++;
  // }

  void searchedList(String query) {
    if (query.isEmpty) {
      emit(CharactersLoaded(_allCharacters));
    } else {
      final filtered = _allCharacters
          .where(
            (Results e) => e.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      emit(CharactersLoaded(filtered));
    }
  }

  void clearSearchedList() {
    emit(CharactersLoaded(_allCharacters));
  }
}
