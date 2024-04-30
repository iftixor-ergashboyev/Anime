import '../model/anime.dart';

abstract class NetworkRepository {
  Future<List<Anime>> getAnimeList(int page);
}