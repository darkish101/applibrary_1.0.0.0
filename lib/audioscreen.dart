import 'dart:convert';
import 'package:applibrary/audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/BookObj.dart';
import 'model/AudioObj.dart';

class AudioScreen extends StatefulWidget {
  final String Book_Img;
  final String Book_Name;
  final int Book_ID;

  AudioScreen(
      {required this.Book_Img, required this.Book_Name, required this.Book_ID});

  @override
  _AudioScreenState createState() =>
      _AudioScreenState(Book_Img, Book_Name, Book_ID.toString());
}

class _AudioScreenState extends State<AudioScreen> {
  Future<List<AudioObj>> getdata() async {
    var url = "http://books.waqaar.com/api/Audio_Files/GetAllBook_Audio";

    var jsonData = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "GET"
        },
        body: jsonEncode(<String, dynamic>{"id": Book_ID}));

    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<AudioObj> Audios = [];

      for (var u in data) {
        AudioObj gene = AudioObj.fromjson(u);
        Audios.add(gene);
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

  final String Book_Img;
  final String Book_Name;
  final String Book_ID;

  _AudioScreenState(this.Book_Img, this.Book_Name, this.Book_ID);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff8f6ec),
        appBar: AppBar(
          backgroundColor: Color(0xff90816C),
          title: Text("Audio screen"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${Book_Img}"),
                      )),
                ),
                SizedBox(height: 25),
                Text(
                  "${Book_Name}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
