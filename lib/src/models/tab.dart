import 'package:app_elllo/src/utils/constants.dart';

class TabChoice {
  final String title;

  TabChoice({this.title});
}

List<TabChoice> tabs = <TabChoice>[
  TabChoice(title: CategoryName.CATEGORY_TUTORIAL),
  TabChoice(title: CategoryName.CATEGORY_LEVEL),
  TabChoice(title: CategoryName.CATEGORY_AUDIO),
  TabChoice(title: CategoryName.CATEGORY_VIDEO),
  TabChoice(title: CategoryName.CATEGORY_MIXER),
];
