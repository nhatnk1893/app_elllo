import 'package:app_elllo/src/template/chapter/widgets/audio_player.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                child: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Html(data: '''${widget.script}'''),
              ),
            )),
            Container(
              height: 8.0,
              decoration: BoxDecoration(color: Colors.blue[300]),
            ),
            AudioPlayersWidget(
              url: widget.url,
            )
          ],
        ),
      ),
    );
  }
}
