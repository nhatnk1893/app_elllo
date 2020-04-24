import 'package:app_elllo/src/utils/constants.dart';

class TabChoice {
  final String title;
  final String value;
  TabChoice({this.title, this.value});
}

List<TabChoice> tabs = <TabChoice>[
  TabChoice(
      title: CategoryName.CATEGORY_AUDIO,
      value: CategoryName.CATEGORY_AUDIO.toLowerCase()),
  TabChoice(
      title: CategoryName.CATEGORY_VIDEO,
      value: CategoryName.CATEGORY_VIDEO.toLowerCase()),
];
