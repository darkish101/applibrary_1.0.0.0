import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFdbd1b4),
        body: SfPdfViewer.network(
          "https://enseyab.net/MtonBooks/0001AthkaarAlQasim.pdf",
          key: _pdfViewerStateKey,
        ),
        appBar: AppBar(
          title: Text("PDF VIEW PAGE"),
          backgroundColor: Colors.brown,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _pdfViewerStateKey.currentState!.openBookmarkView();
                },
                icon: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
