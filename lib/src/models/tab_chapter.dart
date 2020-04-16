import 'package:app_elllo/src/utils/constants.dart';

class TabChapterChoice {
  final String title;

  TabChapterChoice({this.title});
}

List<TabChapterChoice> tabsChapter = <TabChapterChoice>[
  TabChapterChoice(title: TabChapterName.TAB_SCRIPT),
  TabChapterChoice(title: TabChapterName.TAB_VOCABFRAMMAR),
  TabChapterChoice(title: TabChapterName.TAB_QUIZ),
];
