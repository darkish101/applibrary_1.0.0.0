import 'package:applibrary/model/AudioObj.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  final AudioObjf;
  final Url;
  final Name;
  final Sec;
  final Desc;
  final Length;

  const AudioFile({
    Key? key,
    required this.advancedPlayer,
    required this.AudioObjf,
    required this.Length,
    required this.Url,
    required this.Name,
    required this.Sec,
    required this.Desc,
  }) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState(
        advancedPlayer,
        AudioObjf,
        Length,
        Url,
        Name,
        Sec,
        Desc,
      );
}

class _AudioFileState extends State<AudioFile> {
  final AudioObj AudioObjf;
  final AudioPlayer advancedPlayer;
  final Length;
  final Url;
  final Name;
  final Sec;
  final Desc;

  _AudioFileState(this.advancedPlayer, this.AudioObjf, this.Length, this.Url,
      this.Name, this.Sec, this.Desc);

  Duration _duration = Duration();
  Duration _position = Duration();

  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Color(0xff90816C);
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();

    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.advancedPlayer.setUrl("${Url}");
    this.widget.advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        isPlaying = false;
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      padding: EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? Icon(
              _icons[0],
              size: 50,
              color: Color(0xff90816C),
            )
          : Icon(
              _icons[1],
              size: 50,
              color: Color(0xff90816C),
            ),
      onPressed: () {
        if (isPlaying == false) {
          this.widget.advancedPlayer.play("${Url}");
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Color(0xff90816C),
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeTosecond(value.toInt());
            value = value;
          });
        });
  }

  Widget btnForward() {
    return IconButton(
      icon: Icon(Icons.skip_next),
      iconSize: 40,
      color: Color(0xff90816C),
      onPressed: () {
        setState(() {});
      },
    );
  }

  Widget btnBackwards() {
    return IconButton(
      icon: Icon(Icons.skip_previous),
      iconSize: 40,
      color: Color(0xff90816C),
      onPressed: () {
        setState(() {});
      },
    );
  }

  btnRepeat() {
    return IconButton(
      icon: Icon(Icons.repeat),
      iconSize: 40,
      color: color,
      onPressed: () {
        if (isRepeat == false) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat = true;
            color = Colors.teal;
          });
        } else if (isRepeat == true) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          setState(() {
            isRepeat = false;
            color = Color(0xff90816C);
          });
        }
      },
    );
  }

  void changeTosecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnBackwards(),
          btnStart(),
          btnForward(),
        ],
      ),
    );
  }

  // Widget playList() {
  //   return SizedBox(
  //     height: 80,
  //     width: 250,
  //     child: ListView.builder(
  //       itemCount: 1,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           elevation: 5,
  //           child: Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Column(
  //               children: [
  //                 Text("${Name}"),
  //                 Text("${Sec}"),
  //                 Text("${Desc}"),
  //                 Text("${Url}"),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          slider(),
          loadAsset(),
          // SizedBox(height: 20),
          // playList(),
        ],
      ),
    );
  }
}
