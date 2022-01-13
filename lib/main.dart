import 'package:applibrary/bookapi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'indvBook.dart';
import 'bookview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(App_Library());
}

class App_Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Individual book',
      routes: {
        'BookView': (context) => BookView(),
        'BookAPI': (context) => Book(),
        'Individual book': (context) => IBook(),
      },
    );
  }
}
