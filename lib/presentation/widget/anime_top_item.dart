import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/model/anime.dart';

class AnimeTopItem extends StatelessWidget {
  const AnimeTopItem({super.key, required this.onClick, required this.anime,});

  final VoidCallback onClick;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        height: 250,
        child: Stack(
          children: [
            Image.network(anime.image ?? "", fit: BoxFit.fill,),
            Center(
              child: Icon(
                CupertinoIcons.play_circle, color: Colors.white,
              ),
            ),
            Positioned(child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(anime.name ?? ""),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Chip(label: Text("Genre")),
                         Chip(label: Text("Genre")),
                         Chip(label: Text("Genre")),
                       ],
                     ),
                      Spacer(),
                      Icon(CupertinoIcons.star_fill, color: CupertinoColors.activeOrange),
                      Text("8.2/10")
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
