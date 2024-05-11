import 'package:anime/presentation/viewmodel/bm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/model/anime_db.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<BmProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark"),
      ),
      body: StreamBuilder(
        stream: provider.fetchLocalAnimeList(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
            return _successField(snapshot.data ?? []);
          } else {
            return const Center(child: CupertinoActivityIndicator(),);
          }
        },
      ),
    );
  }
  Widget _successField(List<AnimeDb> animeList) {
    return Container(

    );
  }
}
