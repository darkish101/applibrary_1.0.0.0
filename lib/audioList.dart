import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'model/AudioObj.dart';
import 'audioscreen.dart';

class MidAudioList extends StatefulWidget {
  final String Book_Img;
  final String Book_Name;
  final int Book_ID;

  const MidAudioList(
      {Key? key,
      required this.Book_Img,
      required this.Book_Name,
      required this.Book_ID})
      : super(key: key);

  @override
  _MidAudioListState createState() =>
      _MidAudioListState(Book_Img, Book_Name, Book_ID);
}

class _MidAudioListState extends State<MidAudioList> {
  final Book_Img;
  final Book_Name;
  final Book_ID;

  _MidAudioListState(this.Book_Img, this.Book_Name, this.Book_ID);

  Future<List<AudioObj>> getdata() async {
    var url = "http://books.waqaar.com/api/Audio/GetAllBook_Audio";

    var jsonData = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "POST"
        },
        body: jsonEncode(<String, dynamic>{"id": Book_ID}));

    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<AudioObj> Audios = [];

      for (var d in data) {
        AudioObj audio = AudioObj.fromjson(d);
        Audios.add(audio);
      }

      return Audios;
    } else {
      throw Exception("Error in the json status");
    }
  }

  late Future<List<AudioObj>> Audios;

  @override
  void initState() {
    Audios = getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff90816C),
          title: Text("${Book_Name}"),
        ),
        backgroundColor: Color(0xfff8f6ec),
        body: FutureBuilder<List<AudioObj>>(
            future: Audios,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: Color(0xff90816c), width: 1),
                        ),
                        elevation: 20,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  primary: Color(0xff90816C),
                                  minimumSize: Size(50, 30),
                                ),
                                child: Text(
                                  "إستماع",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AudioScreen(
                                              Book_Img: Book_Img,
                                              Book_Name: Book_Name,
                                              Book_ID: Book_ID,
                                              Audio_ID: snapshot
                                                  .data![index].Audio_ID,
                                            ))),
                              ),
                              SizedBox(width: 190),
                              Text(
                                "${snapshot.data![index].Audio_Name}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(
                                  fontSize: 16,
                                  color: Colors.brown,
                                ),
                              ),
                              // Text(
                              //   "${snapshot.data![index].Section_Name}",
                              //   textAlign: TextAlign.center,
                              //   style: GoogleFonts.cairo(
                              //     fontSize: 16,
                              //     color: Colors.brown,
                              //   ),
                              // ),
                              // Text(
                              //   "${snapshot.data![index].Description}",
                              //   textAlign: TextAlign.center,
                              //   style: GoogleFonts.cairo(
                              //     fontSize: 16,
                              //     color: Colors.brown,
                              //   ),
                              // ),
                              // Text(
                              //   "${snapshot.data![index].Audio_ID}",
                              //   textAlign: TextAlign.center,
                              //   style: GoogleFonts.cairo(
                              //     fontSize: 16,
                              //     color: Colors.brown,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
