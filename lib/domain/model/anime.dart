class Anime {
  int? malId;
  String? url;
  String? image;
  String? name;
  String? nameKanji;
  List<String>? nicknames;
  int? favorites;
  String? about;

  Anime({
    required this.malId,
    required this.url,
    required this.image,
    required this.name,
    required this.nameKanji,
    required this.nicknames,
    required this.favorites,
    required this.about,
  });
}