import 'package:flutter/cupertino.dart';
import '../../data/repository/local_repository_impl.dart';
import '../../domain/model/anime_db.dart';

class BmProvider extends ChangeNotifier {
  final _local = LocalRepositoryImpl();
  Stream<List<AnimeDb>>? fetchLocalAnimeList() => _local.getFavoriteAnimeList();

  void delete(AnimeDb anime) async {
    await _local.deleteFavoriteAnime(anime);
  }
}