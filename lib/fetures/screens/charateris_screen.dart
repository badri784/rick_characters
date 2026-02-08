import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../core/bloc/cubit/characters_cubit.dart';
import '../../core/theming/colors.dart';
import '../../core/widget/build_no_internet.dart';
import '../widget/bloc_widget.dart';

class CharaterisScreen extends StatefulWidget {
  const CharaterisScreen({super.key});

  @override
  State<CharaterisScreen> createState() => _CharaterisScreenState();
}

class _CharaterisScreenState extends State<CharaterisScreen> {
  final TextEditingController _editingController = TextEditingController();
  bool _isSearching = false;

  Widget _appBar() {
    return const Text(
      'Characters',
      style: TextStyle(fontSize: 18, color: ColorsManger.gray),
    );
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    context.read<CharactersCubit>().clearSearchedList();
    setState(() {
      _editingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.gray,
      appBar: AppBar(
        leading: _isSearching
            ? BackButton(
                color: ColorsManger.gray,
                onPressed: () => _stopSearching(),
              )
            : Container(),
        title: _isSearching ? searchField(context) : _appBar(),
        actions: [
          _isSearching
              ? IconButton(
                  onPressed: () {
                    _stopSearching();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_outlined),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      _startSearch();
                      setState(() {
                        _isSearching = true;
                      });
                      searchField(context);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
        ],
        backgroundColor: ColorsManger.yellow,
        centerTitle: true,
      ),
      // offline hint for network
      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity.contains(
                ConnectivityResult.none,
              );
              if (connected) {
                return const CharactersBody();
              } else {
                return const BuildNoInternetConnetion();
              }
            },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  TextField searchField(BuildContext context) {
    return TextField(
      cursorColor: ColorsManger.gray,
      controller: _editingController,
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
