import 'dart:typed_data';
import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:anime/domain/model/anime_db.dart';
import 'package:anime/domain/repository/local_repository.dart';
import 'package:flutter/material.dart';
import '../../domain/model/anime.dart';
import 'package:http/http.dart'as http;

class DetailProvider extends ChangeNotifier {
  final LocalRepository _localRepository = LocalRepositoryImpl();
  bool isSaved = false;
  Uint8List? _uInt8list;

  void checkSavedOrNot(int id) async {
    final anime = await _localRepository.findAnimeById(id);
    isSaved = anime != null;
    notifyListeners();
  }
  void saveOrDelete(Anime anime) async {
    _uInt8list ??= await LinkToByteArray(anime.image ?? "");
    final LocalAnime = AnimeDb(
      id: null,
      name: anime.name,
      nameKanji: anime.nameKanji,
      nickName: anime.nicknames?[0],
      about: anime.about,
      imageData: _uInt8list
    );
    if(isSaved) {
      await _localRepository.deleteFavoriteAnime(LocalAnime);
      isSaved = false;
    } else {
      await _localRepository.saveFavoriteAnime(LocalAnime);
      isSaved = true;
    }
    notifyListeners();
  }
  Future<Uint8List?> LinkToByteArray(String image) async {
    final response = await http.get(Uri.parse(image));

    if(response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  }
}