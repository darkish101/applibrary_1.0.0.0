import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookView extends StatefulWidget {
  final String Pdf_URL;
  final String Book_Name;

  BookView({required this.Book_Name, required this.Pdf_URL});

  @override
  _BookViewState createState() => _BookViewState(Book_Name, Pdf_URL);
}

class _BookViewState extends State<BookView> {
  final String Pdf_URL;
  final String Book_Name;

  _BookViewState(this.Book_Name, this.Pdf_URL);

  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFdbd1b4),
        body: SfPdfViewer.network(
          "${Pdf_URL}",
          key: _pdfViewerStateKey,
        ),
        appBar: AppBar(
          title: Text("${Book_Name}"),
          backgroundColor: Color(0xff90816C),
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
