import 'package:app_elllo/src/models/course/course.dart';
import 'package:app_elllo/src/template/tabs/view_model.dart';
import 'package:app_elllo/src/template/utils/fetch_fail.dart';
import 'package:app_elllo/src/template/utils/list_item_course.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabMixer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabViewModel>(builder:
        (BuildContext context, TabViewModel tabViewModel, Widget child) {
      return Scaffold(
          body: tabViewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : tabViewModel.mixerDataLst.isEmpty
                  ? FailApi()
                  : RefreshIndicator(
                      child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 8.0),
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: tabViewModel.mixerDataLst.length,
                        itemBuilder: (BuildContext context, int index) {
                          Course course = tabViewModel.mixerDataLst[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            child: CourseItem(
                                img: course.thumnailUrl,
                                title: course.title,
                                subTitle: course.subTitle,
                                lesson: course,
                                tabName: TABMIXER),
                          );
                        },
                      ),
                      onRefresh: () => tabViewModel.fetchData()));
    });
  }
}
