import 'dart:developer';

import '../../models/characters.dart';
import '../web_services/web_service.dart';

class CharactersRepo {
  final WebService webService;
  CharactersRepo(this.webService);

  // Future<Characters> getAllChracters() async {
  //   final response = await webService.getAllCharacters();
  //   return response;
  // }

  Future<Characters> getCharacters(int page) async {
    try {
      final response = await webService.getCharactersByPage(page);
      // log('response in characters repo: ${response.characters.toString()}');
      return response;
    } catch (e) {
      log('error in characters repo $e');

      rethrow;
    }
  }
}
