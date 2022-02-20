import 'package:applibrary/bookapi.dart';
import 'package:applibrary/model/BookObj.dart';
import 'package:applibrary/navbar.dart';
import 'package:flutter/material.dart';
import 'indvBook.dart';
import 'bookview.dart';

Future main() async {
  runApp(App_Library());
}

class App_Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'NAVI',
      routes: {
        'BookMain': (context) => Book(),
        'NAVI': (context) => NavBar(),
      },
    );
  }
}
