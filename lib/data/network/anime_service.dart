import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import '../model/anime_response.dart';

part 'anime_service.g.dart';

@RestApi()
abstract class AnimeService {
  factory AnimeService(Dio dio, {String baseUrl}) = _AnimeService;

  @GET("/top/characters")
  Future<AnimeResponse> getAnimeList();
}

Dio buildDioClient(String baseUrl) { // build dio client
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}