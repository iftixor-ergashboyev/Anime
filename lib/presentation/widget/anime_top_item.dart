import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../domain/model/anime.dart';

class AnimeTopItem extends StatelessWidget {
  const AnimeTopItem({super.key, required this.onClick, required this.anime,});

  final VoidCallback onClick;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          ClipRRect( borderRadius: BorderRadius.circular(12), child: Image.network(anime.image ?? "", fit: BoxFit.fill, width: double.infinity, height: double.infinity)),
          Center(
            child: Icon(
              CupertinoIcons.play_circle, color: Colors.white, size: 24,
            ),
          ),
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black45,
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(anime.name ?? "", style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(anime.nameKanji ?? "", style: TextStyle(fontSize: 14, color: Colors.white)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(CupertinoIcons.star_fill, color: CupertinoColors.activeOrange, size: 18),
                        const Gap(2),
                        Text(_getRandomRating()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
  _getRandomRating() {
    final random = Random().nextInt(6) + 5;
    return "$random/10";
  }
}
