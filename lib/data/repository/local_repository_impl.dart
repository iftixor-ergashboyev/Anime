import 'package:anime/data/local/anime_database.dart';
import 'package:anime/data/local/cache_manager.dart';
import 'package:anime/domain/model/anime_db.dart';
import '../../domain/repository/local_repository.dart';
import '../local/anime_dao.dart';

class LocalRepositoryImpl extends LocalRepository {
  final _cache = CacheManager();

  late AnimeDao _dao;

  @override
  Future<void> init() async {
    final database = await $FloorAnimeDatabase.databaseBuilder("anime.db").build();
    _dao = database.animeDao;
  }

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
    await _dao.clearAnimeList();
  }

  @override
  Future<void> deleteFavoriteAnime(AnimeDb anime) async {
    await _dao.deleteAnime(anime);
  }


  @override
  Stream<List<AnimeDb>> getFavoriteAnimeList() => _dao.getAllAnimeList();


  @override
  Future<void> saveFavoriteAnime(AnimeDb anime) async {
    await _dao.saveAnime(anime);
  }

  @override
  Future<AnimeDb?> findAnimeById(int id) async {
    return await _dao.findAnimeById(id);
  }
}