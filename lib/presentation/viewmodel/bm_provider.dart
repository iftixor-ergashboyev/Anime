import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:anime/domain/model/anime_db.dart';
import 'package:flutter/cupertino.dart';

class BmProvider extends ChangeNotifier {
  final _local = LocalRepositoryImpl();
  // final List<AnimeDb> animeList = [];

  Stream<List<AnimeDb>>? fetchLocalAnimeList() => _local.getFavoriteAnimeList();

  void delete(AnimeDb anime) async {
    await _local.deleteFavoriteAnime(anime);
  }
}