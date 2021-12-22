import 'package:flutter/material.dart';
import 'home.dart';
import 'books.dart';
import 'bookview.dart';

void main() {
  runApp(App_Library());
}

class App_Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen': (context) => HomeScreen(),
        'BookScreen': (context) => BookScreen(),
        'BookView': (context) => BookView(),
      },
    );
  }
}
