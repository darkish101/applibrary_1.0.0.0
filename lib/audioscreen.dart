import 'package:applibrary/audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioScreen extends StatefulWidget {
  final String Book_Img;
  final String Book_Name;

  AudioScreen({required this.Book_Img, required this.Book_Name});

  @override
  _AudioScreenState createState() => _AudioScreenState(Book_Img, Book_Name);
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer advancedPlayer;

  final String Book_Img;
  final String Book_Name;

  _AudioScreenState(this.Book_Img, this.Book_Name);

  @override
  void initState() {
    super.initState();

    advancedPlayer = AudioPlayer();
  }

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
