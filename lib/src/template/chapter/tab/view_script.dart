import 'dart:async';

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
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState;
  Duration duration = new Duration();
  Duration position = new Duration();
  double backRate = 1.0;
  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;

  get _durationText => duration?.toString()?.split('.')?.first ?? '';
  get _positionText => position?.toString()?.split('.')?.first ?? '';
  void initPlayer() {
    audioPlayer = new AudioPlayer();

    audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          position = p;
        });
  }

  void play() async {
    final playPosition = (position != null &&
            duration != null &&
            position.inMilliseconds > 0 &&
            position.inMilliseconds < duration.inMilliseconds)
        ? position
        : null;
    final result =
        await audioPlayer.play('${widget.url}', position: playPosition);
    if (result == 1) setState(() => _playerState = PlayerState.playing);

    audioPlayer.setPlaybackRate(playbackRate: 1.0);
  }

  void pause() async {
    await audioPlayer.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  void resume() async {
    await audioPlayer.stop();
  }

  Widget slider() {
    return Column(
      children: <Widget>[
        Slider(
            activeColor: Colors.black,
            inactiveColor: Colors.pink,
            value: position.inSeconds.toDouble(),
            min: 0.0,
            max: duration.inSeconds.toDouble(),
            onChanged: (double value) {
              setState(() {
                seekToSecond(value.toInt());
                value = value;
              });
            }),
        Padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                position != null
                    ? '${_positionText ?? ''} '
                    : duration != null ? _durationText : '',
              ),
              Text(
                position != null
                    ? '${_durationText ?? ''} '
                    : duration != null ? _durationText : '',
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          StreamProvider<Duration>.value(
              initialData: Duration(),
              value: audioPlayer.onAudioPositionChanged),
        ],
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              child: Html(data: '''${widget.script}'''),
            )),
            Container(
                child: Column(
              children: <Widget>[
                slider(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.replay),
                        onPressed: () => resume(),
                        iconSize: 56,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: _isPlaying
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_circle_outline),
                        onPressed: _isPlaying ? () => pause() : () => play(),
                        iconSize: 72,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.replay),
                        onPressed: () => resume(),
                        iconSize: 56,
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
