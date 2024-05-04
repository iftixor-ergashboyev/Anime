import 'package:flutter/material.dart';

import '../widget/bottom_tab.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _pages = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Expanded(child: _pages[_selectedIndex]),
            Positioned(bottom: 0,right: 0,left: 0,child: MyBottomTab(
              selectedIndex: _selectedIndex,
              onClick: (index) => setState(() { _selectedIndex = index; }),
            ))
          ],
        )
    );
  }
}