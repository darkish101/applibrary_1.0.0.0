import 'dart:convert';
import 'package:applibrary/audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/BookObj.dart';
import 'model/AudioObj.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'panel_widget.dart';

class AudioScreen extends StatefulWidget {
  final String Book_Img;
  final String Book_Name;
  final int Book_ID;
  final int Audio_ID;

  AudioScreen(
      {required this.Book_Img,
      required this.Book_Name,
      required this.Book_ID,
      required this.Audio_ID});

  @override
  _AudioScreenState createState() =>
      _AudioScreenState(Book_Img, Book_Name, Book_ID, Audio_ID);
}

class _AudioScreenState extends State<AudioScreen> {
  Future<List<AudioObj>> getdata() async {
    var url = "http://books.waqaar.com/api/Audio/GetAudioById";

    var jsonData = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "POST"
        },
        body: jsonEncode(<String, dynamic>{"Audio_ID": Audio_ID}));

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

  late AudioPlayer advancedPlayer;

  @override
  void initState() {
    Audios = getdata();
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  final String Book_Img;
  final String Book_Name;
  final int Book_ID;
  final int Audio_ID;

  _AudioScreenState(this.Book_Img, this.Book_Name, this.Book_ID, this.Audio_ID);

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff8f6ec),
        appBar: AppBar(
          backgroundColor: Color(0xff90816C),
          title: Text("Audio screen"),
        ),
        body: SlidingUpPanel(
          color: Color(0xff90816C),
          controller: panelController,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          parallaxEnabled: true,
          parallaxOffset: .5,
          minHeight: MediaQuery.of(context).size.height * 0.07,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            panelController: panelController,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Column(
                children: [
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Book_Img,
                        height: 210,
                        width: 160,
                        fit: BoxFit.fill,
                      ),
                    ),
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
                  SizedBox(height: 25),
                  FutureBuilder<List<AudioObj>>(
                      future: Audios,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (listContext, index) {
                                  return AudioFile(
                                    advancedPlayer: advancedPlayer,
                                    AudioObjf: snapshot.data![index],
                                    Url: snapshot.data![index].Audio_URL,
                                    Name: snapshot.data![index].Audio_Name,
                                    Sec: snapshot.data![index].Section_Name,
                                    Desc: snapshot.data![index].Description,
                                    Length: snapshot.data!.length,
                                  );
                                }),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
