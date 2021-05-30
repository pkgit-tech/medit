import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../globals.dart';

typedef OnError = void Function(Exception exception);

class PlaySoundScreen extends StatefulWidget {
  String? title;
  PlaySoundScreen({this.title});

  @override
  _PlaySoundScreenState createState() => _PlaySoundScreenState();
}

class _PlaySoundScreenState extends State<PlaySoundScreen> {
  bool isPlaying = false;
  bool isPaused = false;
  Duration? _duration;
  Duration? _position;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;

  static AudioCache audioCache = AudioCache();
  AudioPlayer player = AudioPlayer();
  String? localFilePath;

  @override
  void initState() {
    // TODO: implement initState
    initMyAudioPlayer();
    super.initState();
  }

  initMyAudioPlayer() async {
    audioCache = AudioCache(fixedPlayer: player);

    _durationSubscription = player.onDurationChanged.listen((d) {
      setState(() {
        this._duration = d;
      });
    });
    _positionSubscription = player.onAudioPositionChanged.listen((p) {
      setState(() {
        this._position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title != null ? widget.title! : "Mental Training",
          style: getTextStyle(
              size: 22, fcolor: Colors.white, weightf: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
        leading: new Container(),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_med.png'),
                  fit: BoxFit.fill)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Image(
                          image: AssetImage('assets/images/like_med.png'),
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: this.isPlaying
                            ? Icon(
                                Icons.pause_circle_outline,
                                color: Colors.white,
                                size: 35.0,
                              )
                            : Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 35.0,
                              ),
                        onPressed: () async {
                          playHandler();
                        },
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image(
                          image: AssetImage('assets/images/settings.png'),
                        ),
                      )
                    ],
                  ),
                  slider()
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void playHandler() async {
    if (!this.isPlaying) {
      // audioCache.play('moonlight.mp3');
      player = await audioCache.play('audio/moonlight.mp3');

      _durationSubscription = player.onDurationChanged.listen((d) {
        setState(() {
          this._duration = d;
        });
      });
      _positionSubscription = player.onAudioPositionChanged.listen((p) {
        setState(() {
          this._position = p;
        });
      });

      setState(() {
        this.isPlaying = true;
      });
    } else if (this.isPlaying) {
      player.stop();
      pauseHandler();
      setState(() {
        this.isPlaying = false;
      });
    }
  }

  void pauseHandler() {
    if (isPaused && isPlaying) {
      player.resume();
    } else {
      player.pause();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  Widget slider() {
    return Slider(
        value: (_position != null) ? _position!.inSeconds.toDouble() : 0.0,
        activeColor: Colors.white,

        /* position.inSeconds.toDouble(),*/
        min: 0.0,
        max: 100,
//        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            value = value;
          });
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.stop();
    audioCache.fixedPlayer?.stop();
    audioCache.clearAll();

    super.dispose();
  }
}
