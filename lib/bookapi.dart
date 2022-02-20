import 'dart:convert';
import 'package:applibrary/indvBook.dart';
import 'package:applibrary/model/RequestApi.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibrary/model/BookObj.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  Future<List<BookObj>> getdata() async {
    var url = "http://books.waqaar.com/api/Books/GetAllBooks";

    var jsonData = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "GET"
        },
        body: jsonEncode(<String, dynamic>{"id": 0}));

    // dynamic api = RequestApi();
    //
    // // RequestApi api = RequestApi(
    // //   url: url,
    // //   method: "GET",
    // //   params: <String, dynamic>{"id": 0},
    // // );
    // api.url = url;
    // api.method = "GET";
    // api.params = {"id": 0};
    // var jsonData = api.call();

    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<BookObj> books = [];

      for (var u in data) {
        BookObj gene = BookObj.fromjson(u);
        books.add(gene);
      }

      return books;
    } else {
      throw Exception("Error in the json status");
    }
  }

  late Future<List<BookObj>> books;

  @override
  void initState() {
    books = getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90816C),
        title: Center(
            child: Text(
          "الصفحة الرئيسية",
          style: GoogleFonts.cairo(
            fontSize: 20,
            color: Colors.white,
          ),
        )),
      ),
      backgroundColor: Color(0xfff8f6ec),
      body: FutureBuilder<List<BookObj>>(
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
                            hintStyle: GoogleFonts.cairo(
                              fontSize: 14,
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
                        return GridTile(
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IBook(
                                        bookObj: snapShout.data![index]))),
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
