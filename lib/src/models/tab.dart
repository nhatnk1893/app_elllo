import 'package:app_elllo/src/utils/constants_api.dart';

class TabChoice {
  final String title;
  final String value;

  TabChoice({this.title, this.value});
}

List<TabChoice> tabs = <TabChoice>[
  TabChoice(title: 'TUTORIAL', value: TABTUTORIAL),
  TabChoice(title: 'LEVEL', value: TABLEVEL),
  TabChoice(title: 'AUDIO', value: TABAUDIO),
  TabChoice(title: 'VIDEO', value: TABVIDEO),
  TabChoice(title: 'MIXER', value: TABMIXER),
];
