import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:anime/domain/repository/local_repository.dart';
import 'package:flutter/material.dart';

import '../../domain/model/anime.dart';

class DetailProvider extends ChangeNotifier {
  final LocalRepository _localRepository = LocalRepositoryImpl();
  bool isSaved = false;

  init() async{
    _localRepository.init();
  }
  void checkSavedOrNot(int id) async {
    final anime = await _localRepository.findAnimeById(id);
    isSaved = anime != null;
    notifyListeners();
  }
  void saveOrDelete(Anime anime) async {
    if(isSaved) {
      await _localRepository.deleteFavoriteAnime(amime.toLocalAnime());
      isSaved = false;
    } else {
      await _localRepository.saveFavoriteAnime(anime.toLocalAnime());
      isSaved = true;
    }
    notifyListeners();
  }
}