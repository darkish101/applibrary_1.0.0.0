import 'dart:convert';
import 'package:applibrary/audioscreen.dart';
import 'package:applibrary/bookapi.dart';
import 'package:applibrary/bookview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibrary/model/Gene.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class IBook extends StatefulWidget {
  final Gene bookalone;

  IBook({required this.bookalone});

  @override
  _IBookState createState() => _IBookState(bookalone);
}

class _IBookState extends State<IBook> {
  final Gene bookalone;

  _IBookState(this.bookalone);

  // Future<List<Gene>> getdata() async {
  //   var url = "http://books.waqaar.com/api/Books/GetAllBooks";
  //
  //   var jsonData = await http.post(Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Access-Control-Allow-Origin': "*",
  //         "Access-Control-Allow-Methods": "GET"
  //       },
  //       body: jsonEncode(<String, dynamic>{"id": bookalone.Book_ID}));
  //   if (jsonData.statusCode == 200) {
  //     List data = jsonDecode(jsonData.body);
  //     List<Gene> Books = [];
  //
  //     for (var u in data) {
  //       Gene gene = Gene.fromjson(u);
  //       Books.add(gene);
  //     }
  //
  //     return Books;
  //   } else {
  //     throw Exception("Error in the json status");
  //   }
  // }
  //
  // late Future<Gene> books;
  //

  // @override
  // void initState() {
  //   // Future<Gene> books = bookalone as Future<Gene>;
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final VAY =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff8f6ec),
        appBar: AppBar(
          backgroundColor: Color(0xff90816C),
          title: Text("${bookalone.Book_Name}"),
        ),
        body:
            //        FutureBuilder<Gene>(
            //         future: books,
            //         builder: (context, snapShout) {
            // if (bookalone.Book_ID > 0) {
            Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 23),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "إسم الكتاب",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${bookalone.Book_Name}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        color: Colors.brown,
                                      ),
                                    ),
                                    Text(
                                      "المؤلف",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "ِ${bookalone.Author_Name}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        color: Colors.brown,
                                      ),
                                    ),
                                    Text(
                                      "التصنيف",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${bookalone.Genre}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        color: Colors.brown,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 25),
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(right: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${bookalone.Book_img}",
                                    height: 210,
                                    width: 160,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          margin: EdgeInsets.only(right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Visibility(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff90816C),
                                    minimumSize: Size(50, 30),
                                  ),
                                  child: Text("تحميل"),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, 'BookView'),
                                ),
                              ),
                              SizedBox(width: 15),
                              Visibility(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff90816C),
                                    minimumSize: Size(50, 30),
                                  ),
                                  child: Text("إستماع"),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AudioScreen(
                                                Book_Img: bookalone.Book_img,
                                                Book_Name: bookalone.Book_Name,
                                              ))),
                                ),
                                visible: bookalone.has_Audio == "true",
                              ),
                              SizedBox(width: 15),
                              Visibility(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff90816C),
                                      minimumSize: Size(50, 30),
                                    ),
                                    child: Text("قراءة"),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BookView(
                                                Book_Name: bookalone.Book_Name,
                                                Pdf_URL: bookalone.Pdf_URL)))
                                    // Navigator.pushNamed(context, 'BookView'),
                                    ),
                                visible: bookalone.Pdf_URL == "" ||
                                        bookalone.Pdf_URL == "null" ||
                                        bookalone.Pdf_URL == null
                                    ? false
                                    : true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Text("عن الكتاب"),
                        Text("${bookalone.Book_Description}"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // }
        // return Center(child: CircularProgressIndicator());
        // },
        // ),
      ),
    );
  }
}

//
// Container(
// margin: EdgeInsets.only(top: 30),
// child: Column(
// children: [
// Container(
// margin: EdgeInsets.only(right: 30),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Column(
// children: [
// Text("إسم الكتاب"),
// Text("Book Name"),
// Text("المؤلف"),
// Text("ِAuthor"),
// Text("التصنيف"),
// Text("Genre"),
// ],
// ),
// SizedBox(width: 30),
// Container(
// height: 180,
// width: 180,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// image: DecorationImage(
// image: NetworkImage(
// "https://a-alqasim.com/wp-content/uploads/2021/04/0001AthkaarAlQasim.jpg"),
// )),
// ),
// ],
// ),
// ),
// SizedBox(height: 40),
// Container(
// margin: EdgeInsets.only(right: 50),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.brown,
// minimumSize: Size(50, 30),
// ),
// child: Text("تحميل"),
// onPressed: () =>
// Navigator.pushNamed(context, 'BookView'),
// ),
// SizedBox(width: 15),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.brown,
// minimumSize: Size(50, 30),
// ),
// child: Text("إستماع"),
// onPressed: () =>
// Navigator.pushNamed(context, 'BookView'),
// ),
// SizedBox(width: 15),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.brown,
// minimumSize: Size(50, 30),
// ),
// child: Text("قراءة"),
// onPressed: () =>
// Navigator.pushNamed(context, 'BookView'),
// ),
// ],
// ),
// ),
// SizedBox(height: 30),
// Text("عن الكتاب"),
// Text("Description"),
// ],
// ),
// );
