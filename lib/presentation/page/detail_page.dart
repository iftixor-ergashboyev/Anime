import 'package:anime/domain/model/anime.dart';
import 'package:anime/presentation/viewmodel/detail_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.anime});
  
  final Anime anime;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late DetailProvider _provider;

  @override
  void initState() {
    Provider.of<DetailProvider>(context, listen: false);
    Provider.of<DetailProvider>(context, listen: false).checkSavedOrNot(widget.anime.malId ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<DetailProvider>(context, listen: true);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              IconButton(onPressed: () => _provider.saveOrDelete(widget.anime), icon: Icon(
                _provider.isSaved ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark
              ),
                color: _provider.isSaved ? Colors.white : Colors.white38  ,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all(16),
              title: Text(widget.anime.name ?? "",
              style: TextStyle(fontSize: 16.0)),
              background: Image.network(
                widget.anime.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 230,
            leading: IconButton(
              icon: Icon(CupertinoIcons.back),
              tooltip: 'Back',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(widget.anime.nameKanji ?? "", style: TextStyle(fontSize: 20)),
                  Gap(20),
                  for(int i = 0; i < (widget.anime.nicknames?.length ?? 0); i++)
                    Text(widget.anime.nicknames?[i] ?? ""),
                  Gap(20),
                  Text(widget.anime.about ?? "")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}