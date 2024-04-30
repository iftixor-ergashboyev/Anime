import 'package:anime/presentation/viewmodel/home_viewmodel.dart';
import 'package:anime/presentation/widget/anime_item.dart';
import 'package:anime/presentation/widget/anime_top_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel _provider;

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).fetchAnimeList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime"),
      ),
      body: _provider.animeList.isNotEmpty ? _successField() : Center(child: CupertinoActivityIndicator(),
      ),
    );
  }

  _successField() {
    return ListView(
      children: [
        Expanded(
            child: CarouselSlider.builder(
              itemCount: _provider.animeList.length,
              itemBuilder: (context, index, v) =>
                  AnimeTopItem(onClick: () {}, anime: _provider.animeList[index]),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                  aspectRatio: 1.2
              ),
            )
        ),
        const Gap(10),
       const  Text("/t/t/tNew Episodes", style: TextStyle(fontSize: 17),),
        const Gap(10),
        SizedBox(
          height: 160,
            child: _provider.animeList2.isNotEmpty ? ListView.builder(
          shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _provider.animeList2.length,
          itemBuilder: (context, index) => Image.network(_provider.animeList2[index].image ?? ""),
        ) : Container()
          ),
        const Gap(10),
        const  Text("/t/t/Trending now", style: TextStyle(fontSize: 17),),
        const Gap(10),
        SizedBox(
            height: 160,
            child: _provider.animeList3.isNotEmpty ? ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _provider.animeList3.length,
              itemBuilder: (context, index) => AnimeItem(anime: _provider.animeList3[index], onClick: () {})
            ) : Container()
        )
      ],
    );
  }

}