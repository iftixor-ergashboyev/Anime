import 'package:anime/data/local/anime_database.dart';
import 'package:anime/presentation/page/home_page.dart';
import 'package:anime/presentation/page/main_page.dart';
import 'package:anime/presentation/viewmodel/bm_provider.dart';
import 'package:anime/presentation/viewmodel/detail_provider.dart';
import 'package:anime/presentation/viewmodel/home_viewmodel.dart';
import 'package:anime/presentation/viewmodel/intro_provider.dart';
import 'package:anime/util/initializer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repository/local_repository_impl.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await $FloorAnimeDatabase.databaseBuilder("anime.db").build();
    Initializer.dao = db.animeDao;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _repo = LocalRepositoryImpl();  

  @override
  Widget build(BuildContext context) {
    // delete
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => IntroProvider()),
        ChangeNotifierProvider(create: (context) => DetailProvider()),
        ChangeNotifierProvider(create: (context) => BmProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey,brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: _repo.isFirstTime(),
          builder: (context, data) {
            return data.data == true ? const HomePage() : MainPage();
          },
        ),
      ),
    );
  }
}