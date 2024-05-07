import '../model/anime_db.dart';

abstract class LocalRepository {
  Future<bool> isFirstTime();
  Future<void> saveIntro(bool firstTime);

    Future<void> init();
  Future<void> saveFavoriteAnime(AnimeDb anime);
  Future<AnimeDb?>findAnimeById(int id);
  Stream<List<AnimeDb>> getFavoriteAnimeList();
  Future<void> clearFavorites();
  Future<void> deleteFavoriteAnime(AnimeDb anime);
}