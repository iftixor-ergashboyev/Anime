import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/model/anime.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem({super.key, required this.anime, required this.onClick});
  final Anime anime;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Image.network(anime.image ?? "", fit: BoxFit.cover),
      ),
    );
  }
}
