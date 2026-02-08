import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/characters.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @GET('character')
  Future<Characters> getAllCharacters();

  @GET('character')
  Future<Characters> getCharactersByPage(@Query('page') int page);
}
