import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/cubit/characters_cubit.dart';
import 'core/models/result/results.dart';
import 'core/networking/repo/characters_repo.dart';
import 'core/networking/web_services/web_service.dart';
import 'fetures/screens/characters_detail.dart';
import 'fetures/screens/charateris_screen.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit characterisCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(WebService(Dio()));
    characterisCubit = CharactersCubit(charactersRepo);
  }

  Route generateRoute(RouteSettings setteings) {
    switch (setteings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                characterisCubit..getAllCharacters(),
            child: const CharaterisScreen(),
          ),
        );
      case 'CharactersDetail':
        final character = setteings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailScreen(character: character),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('There is no Route Here ${setteings.name}'),
            ),
          ),
        );
    }
  }
}
