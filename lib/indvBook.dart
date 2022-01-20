import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibrary/model/Gene.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class IBook extends StatefulWidget {
  const IBook({Key? key}) : super(key: key);

  @override
  _IBookState createState() => _IBookState();
}

class _IBookState extends State<IBook> {
  Future<List<Gene>> getdata() async {
    var url = "http://books.waqaar.com/api/Books/GetAllBooks";

    // final VAY =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    var jsonData = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "GET"
        },
        body: jsonEncode(<String, dynamic>{"id": 3}));
    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Gene> Books = [];

      for (var u in data) {
        Gene gene = Gene.fromjson(u);
        Books.add(gene);
      }

      return Books;
    } else {
      throw Exception("Error in the json status");
    }
  }

  late Future<List<Gene>> books;

  @override
  void initState() {
    books = getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final VAY =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff8f6ec),
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("your mom "),
        ),
        body: FutureBuilder<List<Gene>>(
          future: books,
          builder: (context, snapShout) {
            if (snapShout.hasData) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapShout.data!.length,
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
                                            "${snapShout.data![index].Book_Name}",
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
                                            "ِ${snapShout.data![index].Author_Name}",
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
                                            "${snapShout.data![index].Genre}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.cairo(
                                              fontSize: 16,
                                              color: Colors.brown,
                                            ),
                                          ),
                                          Text("$VAY"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      height: 180,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${snapShout.data![index].Book_img}"),
                                          )),
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
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.brown,
                                        minimumSize: Size(50, 30),
                                      ),
                                      child: Text("تحميل"),
                                      onPressed: () => Navigator.pushNamed(
                                          context, 'BookView'),
                                    ),
                                    SizedBox(width: 15),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.brown,
                                        minimumSize: Size(50, 30),
                                      ),
                                      child: Text("إستماع"),
                                      onPressed: () => Navigator.pushNamed(
                                          context, 'BookView'),
                                    ),
                                    SizedBox(width: 15),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.brown,
                                        minimumSize: Size(50, 30),
                                      ),
                                      child: Text("قراءة"),
                                      onPressed: () => Navigator.pushNamed(
                                          context, 'BookView'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Text("عن الكتاب"),
                              Text(
                                  "${snapShout.data![index].Book_Description}"),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
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
