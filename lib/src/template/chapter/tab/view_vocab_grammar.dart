import 'package:app_elllo/src/template/chapter/widgets/audio_player.dart';
import 'package:app_elllo/src/template/chapter/widgets/audio_volume.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class VocabView extends StatelessWidget {
  // final String vocabu;
  // const VocabView({Key key, this.vocabu}) : super(key: key);
  final String url;

  const VocabView({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AudioPlayer advancedPlayer = AudioPlayer();
    return MultiProvider(
        providers: [
          StreamProvider<Duration>.value(
              initialData: Duration(),
              value: advancedPlayer.onAudioPositionChanged),
        ],
        child: Column(
          children: <Widget>[
            AudioPlayersWidget(
              url: url,
            ),
            VolumeWidget()
          ],
        ));
  }
}
