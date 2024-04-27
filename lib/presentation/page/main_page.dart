import 'package:anime/presentation/page/home_page.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _pages = [
    HomePage(),
  Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomTab(
        selectedIndex: _selectedIndex,
        onClick: (index) => setState(() { _selectedIndex = index; }),
      ),
    );
  }
}