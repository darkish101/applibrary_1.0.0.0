import 'package:applibrary/audiopage.dart';
import 'package:applibrary/bookapi.dart';
import 'package:applibrary/fav.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currnetIndex = 0;
  final screens = [
    Book(),
    FavoriteScreen(),
    AudioScreen_OLD(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currnetIndex,
          onTap: (index) => setState(() => currnetIndex = index),
          backgroundColor: Color(0xff90816C),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'الملاحظات',
            ),
          ],
        ),
        body: screens[currnetIndex],
      ),
    );
  }
}
