import 'dart:convert';
import 'package:applibrary/indvBook.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibrary/model/Gene.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  Future<List<Gene>> getdata() async {
    var url = "http://books.waqaar.com/api/Books/GetAllBooks";

    var jsonData = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "GET"
        },
        body: jsonEncode(<String, dynamic>{"id": 0}));
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Main Book page"),
      ),
      backgroundColor: Color(0xfff8f6ec),
      body: FutureBuilder<List<Gene>>(
        future: books,
        builder: (context, snapShout) {
          if (snapShout.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        TextField(
                          textAlign: TextAlign.end,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 30),
                            border: InputBorder.none,
                            hintText: 'إبحث عن كتاب',
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(left: 10, top: 8, child: Icon(Icons.search)),
                      ],
                    ),
                    height: 39,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: snapShout.data!.length,
                      itemBuilder: (context, index) {
                        final VAY = "${snapShout.data![index].Book_ID}";
                        return GridTile(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, 'INDV',
                                arguments: {VAY: ''}),
                            child: Ink.image(
                              image: NetworkImage(
                                "${snapShout.data![index].Book_img}",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// Container(
// height: 220,
// width: 10,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// image: DecorationImage(
// image: NetworkImage(
// "https://a-alqasim.com/wp-content/uploads/2021/04/0001AthkaarAlQasim.jpg"),
// )),
// ),
