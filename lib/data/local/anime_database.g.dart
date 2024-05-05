// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAnimeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AnimeDatabaseBuilder databaseBuilder(String name) =>
      _$AnimeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AnimeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AnimeDatabaseBuilder(null);
}

class _$AnimeDatabaseBuilder {
  _$AnimeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AnimeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AnimeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AnimeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AnimeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AnimeDatabase extends AnimeDatabase {
  _$AnimeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AnimeDao? _animeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AnimeDb` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `animeId` INTEGER, `name` TEXT, `nameKanji` TEXT, `nickName` TEXT, `about` TEXT, `imageData` BLOB)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AnimeDao get animeDao {
    return _animeDaoInstance ??= _$AnimeDao(database, changeListener);
  }
}

class _$AnimeDao extends AnimeDao {
  _$AnimeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _animeDbInsertionAdapter = InsertionAdapter(
            database,
            'AnimeDb',
            (AnimeDb item) => <String, Object?>{
                  'id': item.id,
                  'animeId': item.animeId,
                  'name': item.name,
                  'nameKanji': item.nameKanji,
                  'nickName': item.nickName,
                  'about': item.about,
                  'imageData': item.imageData
                },
            changeListener),
        _animeDbDeletionAdapter = DeletionAdapter(
            database,
            'AnimeDb',
            ['id'],
            (AnimeDb item) => <String, Object?>{
                  'id': item.id,
                  'animeId': item.animeId,
                  'name': item.name,
                  'nameKanji': item.nameKanji,
                  'nickName': item.nickName,
                  'about': item.about,
                  'imageData': item.imageData
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AnimeDb> _animeDbInsertionAdapter;

  final DeletionAdapter<AnimeDb> _animeDbDeletionAdapter;

  @override
  Future<AnimeDb?> findAnimeById(int id) async {
    return _queryAdapter.query('SELECT * FROM anime_db WHERE AnimeId = ?1',
        mapper: (Map<String, Object?> row) => AnimeDb(
            id: row['id'] as int?,
            animeId: row['animeId'] as int?,
            name: row['name'] as String?,
            nameKanji: row['nameKanji'] as String?,
            nickName: row['nickName'] as String?,
            about: row['about'] as String?,
            imageData: row['imageData'] as Uint8List?),
        arguments: [id]);
  }

  @override
  Stream<List<AnimeDb>> getAllAnimeList() {
    return _queryAdapter.queryListStream('SELECT * FROM anime_db',
        mapper: (Map<String, Object?> row) => AnimeDb(
            id: row['id'] as int?,
            animeId: row['animeId'] as int?,
            name: row['name'] as String?,
            nameKanji: row['nameKanji'] as String?,
            nickName: row['nickName'] as String?,
            about: row['about'] as String?,
            imageData: row['imageData'] as Uint8List?),
        queryableName: 'anime_db',
        isView: false);
  }

  @override
  Future<void> clearAnimeList() async {
    await _queryAdapter.queryNoReturn('DELETE FROM anime_db');
  }

  @override
  Future<void> saveAnime(AnimeDb db) async {
    await _animeDbInsertionAdapter.insert(db, OnConflictStrategy.ignore);
  }

  @override
  Future<void> deleteAnime(AnimeDb anime) async {
    await _animeDbDeletionAdapter.delete(anime);
  }
}
