import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../domain/model/anime_db.dart';
import '../viewmodel/bm_provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BmProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      body: StreamBuilder(
        stream: provider.fetchLocalAnimeList(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
            return _successField(snapshot.data ?? []);
          } else if(snapshot.data?.isEmpty == true) {
            return const Center(child: Text("No data."));
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
  Widget _successField(List<AnimeDb> animeList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          // if(index == animeList.length - 1) {
          //   return SizedBox(height: 200);
          // }
          return SizedBox(
            height: 170,
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                // key: const ValueKey(0),
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {
                  print('jfdsk');
                }),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      Provider.of<BmProvider>(context,listen: false).delete(animeList[index]);
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        animeList[index].imageData ?? Uint8List(0),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(animeList[index].name ?? "",style: const TextStyle(
                              fontSize: 19
                          ),),
                          const Gap(8),
                          Text(animeList[index].nameKanji ?? ""),
                          const Gap(8),
                          Text(animeList[index].about ?? "",
                            overflow: TextOverflow.ellipsis,maxLines: 4,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}