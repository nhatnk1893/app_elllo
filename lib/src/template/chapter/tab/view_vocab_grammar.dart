import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class VocabView extends StatelessWidget {
  final String vocabu;

  const VocabView({Key key, this.vocabu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Html(data: '''$vocabu'''),
      ),
    );
  }
}
