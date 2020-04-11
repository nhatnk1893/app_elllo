import 'package:app_elllo/src/utils/constants_api.dart';

class TabChoice {
  final String title;
  final String value;

  TabChoice({this.title, this.value});
}

List<TabChoice> tabs = <TabChoice>[
  TabChoice(title: 'TUTORIAL', value: LESSONSTUTORIAL),
  TabChoice(title: 'LEVEL', value: LESSONSLEVEL),
  TabChoice(title: 'AUDIO', value: LESSONSAUDIO),
  TabChoice(title: 'VIDEO', value: LESSONSVIDEO),
  TabChoice(title: 'MIXER', value: LESSONSMIXER),
];
