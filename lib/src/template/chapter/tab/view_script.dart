import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ScriptView extends StatefulWidget {
  final String script;
  final String url;

  const ScriptView({Key key, this.script, this.url}) : super(key: key);

  @override
  _ScriptViewState createState() => _ScriptViewState();
}

class _ScriptViewState extends State<ScriptView> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      advancedPlayer.startHeadlessService();
    }
  }

  Future<int> _play(url) async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final result = await advancedPlayer.play(url, position: playPosition);

    // default playback rate is 1.0
    // this should be called after _audioPlayer.play() or _audioPlayer.resume()
    // this can also be called everytime the user wants to change playback rate in the UI
    advancedPlayer.setPlaybackRate(playbackRate: 1.0);

    return result;
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 150,
        height: 45,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(txt),
            color: Colors.pink[900],
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.black,
        inactiveColor: Colors.pink,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [
        StreamProvider<Duration>.value(
            initialData: Duration(),
            value: advancedPlayer.onAudioPositionChanged),
      ],
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Html(data: """${widget.script}"""),
          )),
          Container(
            child: Column(
              children: <Widget>[
                _btn('Play', () => audioCache.play('disco.mp3')),
                _btn('Pause', () => advancedPlayer.pause()),
                _btn('Stop', () => advancedPlayer.stop()),
                _btn('Playback',
                    () => advancedPlayer.setPlaybackRate(playbackRate: 2.0)),
                _btn('Playback1',
                    () => advancedPlayer.setPlaybackRate(playbackRate: 1.0)),
                _btn('Playback2',
                    () => advancedPlayer.setPlaybackRate(playbackRate: 0.5)),
                slider()
              ],
            ),
          )
        ],
      ),
    ));
  }
}
