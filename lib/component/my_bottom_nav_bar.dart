import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.onTap});

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    int displayIndex = selectedIndex;
    if (selectedIndex >= 4) {
      displayIndex = 2;
    }

    return SizedBox(
      height: 116,
      child: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Colors.black,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        currentIndex: displayIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index < 4) {
            onTap(index);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc_rounded),
            label: 'NewQ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.follow_the_signs_rounded),
            label: 'MyQ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
