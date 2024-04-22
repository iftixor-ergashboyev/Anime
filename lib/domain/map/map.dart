import 'package:anime/data/model/anime_response.dart';
import 'package:anime/domain/model/anime.dart';

extension Map on Data {
  Anime toAnime() {
    return Anime(
        malId: malId,
        url: url,
        image: images?.jpg?.imageUrl,
        name: name,
        nameKanji: nameKanji,
        nicknames: nicknames,
        favorites: favorites,
        about: about);
  }
}