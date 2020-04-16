import 'package:app_elllo/src/template/chapter/widget/audio_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ScriptView extends StatefulWidget {
  final String script;
  final String url;

  const ScriptView({Key key, this.script, this.url}) : super(key: key);

  @override
  _ScriptViewState createState() => _ScriptViewState();
}

class _ScriptViewState extends State<ScriptView> {
  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Html(data: """${widget.script}"""),
          )),
          Expanded(child: ExampleApp())
        ],
      ),
    );
  }
}
