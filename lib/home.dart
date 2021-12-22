import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'books.dart';
import 'homie.dart';
import 'fav.dart';
import 'audiopage.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = [
    Homie(),
    BookScreen(),
    FavoriteScreen(),
    AudioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdbd1b4),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedFontSize: 19,
        iconSize: 29,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'الكتب',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'المفضلة',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب',
            backgroundColor: Colors.brown,
          ),
        ],
      ),
    );
  }
}

// SafeArea(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// const Padding(
// padding: EdgeInsets.all(20.0),
// child: TextField(
// decoration: InputDecoration(
// hintText: "بحث.....",
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.brown,
// width: 2,
// ),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.brown,
// width: 2,
// ),
// ),
// filled: true,
// focusColor: Colors.white,
// fillColor: Colors.white,
// ),
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextButton(
// style: TextButton.styleFrom(
// padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
// backgroundColor: Colors.white),
// child: const Text(
// 'تصفح الكتب',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.brown,
// ),
// ),
// onPressed: () {
// Navigator.pushNamed(context, 'BookScreen');
// },
// ),
// ],
// ),
// ],
// ),
// ),
