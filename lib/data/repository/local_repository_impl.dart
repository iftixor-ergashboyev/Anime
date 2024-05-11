import 'package:anime/data/local/anime_database.dart';
import 'package:anime/data/local/cache_manager.dart';
import 'package:anime/domain/model/anime_db.dart';
import 'package:anime/util/initializer.dart';
import '../../domain/repository/local_repository.dart';
import '../local/anime_dao.dart';

class LocalRepositoryImpl extends LocalRepository {
  final _cache = CacheManager();

  @override
  Future<bool> isFirstTime() async {
   return _cache.getIntroState();
  }

  @override
  Future<void> saveIntro(bool firstTime) async {
    await _cache.saveIntroState(firstTime);
  }

  @override
  Future<void> clearFavorites() async {
    await Initializer.dao?.clearAnimeList();
  }

  @override
  Future<void> deleteFavoriteAnime(AnimeDb anime) async {
    await Initializer.dao?.deleteAnime(anime);
  }


  @override
  Stream<List<AnimeDb>>? getFavoriteAnimeList() => Initializer.dao?.getAllAnimeList();


  @override
  Future<void> saveFavoriteAnime(AnimeDb anime) async {
    await Initializer.dao?.saveAnime(anime);
  }

  @override
  Future<AnimeDb?> findAnimeById(int id) async {
    return await Initializer.dao?.findAnimeById(id);
  }
}