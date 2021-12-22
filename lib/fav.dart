import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "ًصفحة المفضلة",
        ),
      ),
      backgroundColor: Color(0xFFdbd1b4),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.brown),
            ),
            height: 500,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'الكتاب الأول',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'الكتاب الثاني',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'الكتاب الثالث',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'الكتاب الرابع',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
