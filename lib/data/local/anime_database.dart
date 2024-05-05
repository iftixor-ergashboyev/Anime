import 'dart:async';
import 'dart:typed_data';
import "package:floor/floor.dart";
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../domain/model/anime_db.dart';
import 'anime_dao.dart';

part 'anime_database.g.dart';

@Database(version: 1, entities: [AnimeDb])
abstract class AnimeDatabase extends FloorDatabase {
  AnimeDao get animeDao;
}