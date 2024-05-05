import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../domain/model/anime.dart';

class AnimeTopItem extends StatelessWidget {
  const AnimeTopItem({super.key, required this.anime, required this.onClick});

  final VoidCallback onClick;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(anime.image ?? "",fit: BoxFit.fill, width: double.infinity,height: double.infinity,)),
            const Center(
              child: Icon(CupertinoIcons.play_circle,color: Colors.white,size: 55),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black45,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(anime.name ?? "",style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(anime.nameKanji ?? "",
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.star_fill,color: Colors.orangeAccent,size:15,),
                              const Gap(2),
                              Text(_getRandomRating()),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
  String _getRandomRating() {
    final random = Random().nextInt(6) + 5; // 6 + 5 = 11 => generates random from 5 to 10
    return "$random/10";
  }
}