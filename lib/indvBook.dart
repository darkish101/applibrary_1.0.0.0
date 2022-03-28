import 'package:applibrary/audioList.dart';
import 'package:applibrary/bookview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibrary/model/BookObj.dart';
import 'package:flutter/material.dart';

class IBook extends StatefulWidget {
  final BookObj bookObj;

  IBook({required this.bookObj});

  @override
  _IBookState createState() => _IBookState(bookObj);
}

class _IBookState extends State<IBook> {
  final BookObj bookObj;

  _IBookState(this.bookObj);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff8f6ec),
        appBar: AppBar(
          backgroundColor: Color(0xff90816C),
          title: Text("${bookObj.Book_Name}"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
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
                                      "${bookObj.Book_Name}",
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
                                      "ِ${bookObj.Author_Name}",
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
                                      "${bookObj.Genre}",
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
                                    "${bookObj.Book_img}",
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
                                  child: Text("تحميل",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),),
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
                                  child: Text("إستماع",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MidAudioList(
                                                Book_ID: bookObj.Book_ID,
                                                Book_Img: bookObj.Book_img,
                                                Book_Name: bookObj.Book_Name,
                                              ))),
                                ),
                                visible: bookObj.has_Audio == "true",
                              ),
                              SizedBox(width: 15),
                              Visibility(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff90816C),
                                      minimumSize: Size(50, 30),
                                    ),
                                    child: Text("قراءة",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BookView(
                                                Book_Name: bookObj.Book_Name,
                                                Pdf_URL: bookObj.Pdf_URL)))),
                                visible: bookObj.Pdf_URL == "" ||
                                        bookObj.Pdf_URL == "null" ||
                                        bookObj.Pdf_URL == null
                                    ? false
                                    : true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Text("عن الكتاب",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                            fontSize: 15,
                            color: Colors.grey,
                          ),),
                        Text("${bookObj.Book_Description}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            color: Colors.brown,
                          ),),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
