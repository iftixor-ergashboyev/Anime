import 'dart:typed_data';

import 'package:floor/floor.dart';

@Entity(tableName: "anime_db")
class AnimeDb {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? animeId;
  String? name;
  String? nameKanji;
  String? nickName;
  String? about;
  Uint8List? imageData;

  AnimeDb({this.id, this.animeId, this.name, this.nameKanji, this.nickName, this.about, required this.imageData});

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is AnimeDb &&
        other.id == id &&
        other.animeId == animeId &&
        other.name == name &&
        other.nameKanji == nameKanji &&
        other.nickName == nickName &&
        other.about == about && other.imageData == imageData;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    animeId.hashCode ^
    name.hashCode ^
    nameKanji.hashCode ^
    imageData.hashCode ^
    nickName.hashCode ^
    about.hashCode;
  }

  @override
  String toString() {
    return 'AnimeDb{id: $id, animeId: $animeId, name: $name, nameKanji: $nameKanji, nickName: $nickName, about: $about, imageData: $imageData}';
  }
}