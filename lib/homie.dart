import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          "الصفحة الرئيسية",
        ),
      ),
      backgroundColor: Color(0xFFdbd1b4),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "بحث.....",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                      backgroundColor: Colors.white),
                  child: const Text(
                    'تصفح الكتب',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'BookView');
                  },
                ),
                SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(85, 10, 85, 10),
                      backgroundColor: Colors.white),
                  child: const Text(
                    'تصفح الصوتيات',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'BookView');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
