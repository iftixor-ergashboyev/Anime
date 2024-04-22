import 'package:anime/presentation/page/home_page.dart';
import 'package:anime/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (v) => HomeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,  
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey,brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}