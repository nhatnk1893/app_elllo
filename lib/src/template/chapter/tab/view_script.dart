import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:provider/provider.dart';

enum PlayerState { stopped, playing, paused }

class ScriptView extends StatefulWidget {
  final String script;
  final String url;

  const ScriptView({Key key, this.script, this.url}) : super(key: key);

  @override
  _ScriptViewState createState() => _ScriptViewState();
}

class _ScriptViewState extends State<ScriptView> {
  AudioPlayerState _audioPlayerState;
  PlayerState _playerState = PlayerState.stopped;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;
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
    if (result == 1) setState(() => _playerState = PlayerState.playing);

    advancedPlayer.setPlaybackRate(playbackRate: 1.0);

    return result;
  }

  Future<int> _pause() async {
    final result = await advancedPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
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
                slider(),
                Text('${widget.url}'),
                Row(
                  children: <Widget>[
                    IconButton(
                      key: Key('play_button'),
                      onPressed:
                          _isPlaying ? null : () => _play('${widget.url}'),
                      iconSize: 64.0,
                      icon: Icon(Icons.play_arrow),
                      color: Colors.cyan,
                    ),
                    IconButton(
                      key: Key('pause_button'),
                      onPressed: _isPlaying ? () => _pause() : null,
                      iconSize: 64.0,
                      icon: Icon(Icons.pause),
                      color: Colors.cyan,
                    ),
                    IconButton(
                      key: Key('play_playback2'),
                      onPressed: () =>
                          advancedPlayer.setPlaybackRate(playbackRate: 2.0),
                      iconSize: 64.0,
                      icon: Icon(Icons.slow_motion_video),
                      color: Colors.cyan,
                    ),
                    IconButton(
                      key: Key('play_playback1/2'),
                      onPressed: () =>
                          advancedPlayer.setPlaybackRate(playbackRate: 0.5),
                      iconSize: 64.0,
                      icon: Icon(Icons.slow_motion_video),
                      color: Colors.cyan,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
