import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

enum PlayerState { stopped, playing, paused }

class AudioPlayersWidget extends StatefulWidget {
  final String url;
  final PlayerMode mode;

  const AudioPlayersWidget({Key key, this.url, this.mode}) : super(key: key);

  @override
  _AudioPlayersWidgetState createState() => _AudioPlayersWidgetState();
}

class _AudioPlayersWidgetState extends State<AudioPlayersWidget> {
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
    audioPlayer = new AudioPlayer(mode: widget.mode);

    audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          position = p;
        });
    _playerCompleteSubscription =
        audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        position = new Duration();
      });
    });
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
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

  void setVolume() async {
    seekToSecond(0);
  }

  Widget popupMenuRate() {
    return PopupMenuButton<double>(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[200], width: 1.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'x$backRate',
                style: TextStyle(color: Colors.blue[500], fontSize: 18),
              ),
              SizedBox(
                width: 2.0,
              ),
              Icon(
                Icons.arrow_drop_down_circle,
                size: 16,
                color: Colors.blue[500],
              )
            ],
          )),
      onSelected: (double result) {
        setState(() {
          backRate = result;
        });
        audioPlayer.setPlaybackRate(playbackRate: result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<double>>[
        PopupMenuItem<double>(
            value: 1.75,
            child: Text('Rate 1.75',
                style: TextStyle(
                    color:
                        backRate == 1.75 ? Colors.blue[300] : Colors.black))),
        PopupMenuItem<double>(
          value: 1.25,
          child: Text('Rate 1.25',
              style: TextStyle(
                  color: backRate == 1.25 ? Colors.blue[300] : Colors.black)),
        ),
        PopupMenuItem<double>(
          value: 1.0,
          child: Text('Rate 1.0',
              style: TextStyle(
                  color: backRate == 1.0 ? Colors.blue[300] : Colors.black)),
        ),
        PopupMenuItem<double>(
          value: 0.75,
          child: Text('Rate 0.75',
              style: TextStyle(
                  color: backRate == 0.75 ? Colors.blue[300] : Colors.black)),
        ),
        PopupMenuItem<double>(
          value: 0.5,
          child: Text('Rate 0.5',
              style: TextStyle(
                  color: backRate == 0.5 ? Colors.blue[300] : Colors.black)),
        ),
      ],
    );
  }

  Widget slider() {
    return Padding(
      padding: EdgeInsets.only(left: 4.0, right: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  position != null
                      ? '${_positionText ?? ''} '
                      : duration != null ? _durationText : '',
                  style: TextStyle(color: Colors.blue[300], fontSize: 12),
                ),
                Expanded(
                  child: Slider(
                      activeColor: Colors.blueAccent,
                      inactiveColor: Colors.blue[200],
                      value: position.inSeconds.toDouble(),
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          seekToSecond(value.toInt());
                          value = value;
                        });
                      }),
                ),
                Text(
                    position != null
                        ? '${_durationText ?? ''} '
                        : duration != null ? _durationText : '',
                    style: TextStyle(color: Colors.blue[300], fontSize: 12)),
              ],
            ),
            flex: 4,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: popupMenuRate(),
            flex: 1,
          )
        ],
      ),
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
    return Container(
        child: Column(
      children: <Widget>[
        slider(),
        Row(
          children: <Widget>[
            Container(
              width: 50,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: IconButton(
                    icon: Icon(Icons.replay_10),
                    onPressed: () {
                      audioPlayer
                          .seek(Duration(seconds: position.inSeconds - 10));
                    },
                    iconSize: 36,
                    color: Colors.blue[400],
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: _isPlaying
                        ? Icon(
                            Icons.pause,
                            color: Colors.blue[400],
                          )
                        : Icon(Icons.play_circle_outline,
                            color: Colors.blue[400]),
                    onPressed: _isPlaying ? () => pause() : () => play(),
                    iconSize: 64,
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.forward_10),
                    onPressed: () {
                      audioPlayer
                          .seek(Duration(seconds: position.inSeconds + 10));
                    },
                    iconSize: 36,
                    color: Colors.blue[400],
                  ),
                ),
              ],
            )),
            Container(
              width: 50,
            ),
          ],
        ),
      ],
    ));
  }
}
