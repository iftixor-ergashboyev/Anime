import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../domain/model/anime_db.dart';

class LocalItem extends StatelessWidget {
  const LocalItem({super.key, required this.anime});
  final AnimeDb anime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(anime.name ?? ""),
      subtitle: Text(anime.nameKanji ?? ""),
      trailing: Image.memory( // long int to real image
        anime.imageData ?? Uint8List(0),
        fit: BoxFit.fill,
      ),
    );
  }
}