import 'package:anime/data/network/anime_service.dart';
import 'package:anime/domain/map/map.dart';
import 'package:anime/domain/model/anime.dart';
import 'package:anime/domain/repository/network_repository.dart';
import 'package:anime/util/constants.dart';

class NetworkRepositoryImpl extends NetworkRepository {

  final _service = AnimeService(buildDioClient(Constants.baseUrl));

  @override
  Future<List<Anime>> getAnimeList() async {
    try {
      final response = await _service.getAnimeList();
      final List<Anime> animeList = response.data?.map((e) => e.toAnime()).toList() ?? [];
      return animeList;
    } catch(e) {
      return [];
    }
  }
}