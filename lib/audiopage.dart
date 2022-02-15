import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreen_OLD extends StatefulWidget {
  @override
  State<AudioScreen_OLD> createState() => _AudioScreen_OLDState();
}

class _AudioScreen_OLDState extends State<AudioScreen_OLD> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    // final player = SoundPlayer();
    //
    // final isPlaying = player.isPlaying;
    // final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    // final text = isPlaying ? 'Stop playing' : 'Play';
    //
    // @override
    // void initState() {
    //   super.initState();
    //   player.init();
    // }
    //
    // @override
    // void dispose() {
    //   super.dispose();
    //   player.dispose();
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "ًصفحة الصوتيات",
        ),
      ),
      backgroundColor: Color(0xFFdbd1b4),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.brown),
            ),
            height: 500,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(175, 50),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  icon: Icon(Icons.play_arrow),
                  label: Text("klab"),
                  onPressed: () async {
                    // await player.togglePlaying(
                    //     whenFinished: () => setState(() {}));
                    // setState(() {});
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'المقطع الثاني',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text("$position"),
                    slider(),
                    Text("$duration"),
                  ],
                ),
                InkWell(
                  onTap: () {
                    getAudio();
                  },
                  child: Icon(
                    playing == false
                        ? Icons.play_arrow_outlined
                        : Icons.pause_circle_filled_outlined,
                    size: 100,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'الكتاب الثالث',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(70, 5, 70, 5),
                      backgroundColor: Colors.brown),
                  child: const Text(
                    'الكتاب الرابع',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            audioPlayer.seek(Duration(seconds: value.toInt()));
          });
        });
  }

  void getAudio() async {
    var url = "https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.mp3";

    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
