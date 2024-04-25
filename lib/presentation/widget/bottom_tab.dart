import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class MyBottomTab extends StatefulWidget {

  MyBottomTab({super.key, required this.selectedIndex, required this.onClick});
  final int selectedIndex;
  final void Function(int index) onClick;

  @override
  State<MyBottomTab> createState() => _MyBottomTabState();
}

class _MyBottomTabState extends State<MyBottomTab> {

  final _icons = [
    CupertinoIcons.home,
    CupertinoIcons.bookmark,
    CupertinoIcons.arrow_down_to_line,
    CupertinoIcons.profile_circled
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF313131),
        borderRadius: BorderRadius.circular(100)
      ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        height: 70,
        color: Colors.black45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             _myBtn(() => widget.onClick(0), _icons[0], 0),
              _myBtn(() => widget.onClick(1), _icons[1], 1),
              _myBtn(() => widget.onClick(2), _icons[2], 2),
              _myBtn(() => widget.onClick(3), _icons[3], 3),
            ],
          ),
        )
    );
  }
  _myBtn(VoidCallback onClick, IconData icon, int place) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(50),
      child: GlowIcon(icon, color: widget.selectedIndex == place ? Colors.white : Colors.white60,
        glowColor: widget.selectedIndex == place ? Colors.white : Colors.transparent, size: 18),
    );
  }
}