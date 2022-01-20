import 'package:applibrary/bookapi.dart';

import 'package:flutter/material.dart';
import 'indvBook.dart';
import 'bookview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App_Library());
}

class App_Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'BookMain',
      routes: {
        'BookView': (context) => BookView(),
        'BookMain': (context) => Book(),
        'INDV': (context) => IBook(),
      },
    );
  }
}
