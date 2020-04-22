import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/template/tabs/item_category.dart';
import 'package:app_elllo/src/template/tabs/view_model.dart';
import 'package:app_elllo/src/template/utils/fetch_fail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabAudio extends StatefulWidget {
  @override
  _TabAudioState createState() => _TabAudioState();
}

class _TabAudioState extends State<TabAudio>
    with AutomaticKeepAliveClientMixin<TabAudio> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<TabViewModel>(builder:
        (BuildContext context, TabViewModel tabViewModel, Widget child) {
      var categories = tabViewModel.listCategoryAudio;
      return Scaffold(
          body: tabViewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : categories.isEmpty
                  ? FailApi()
                  : RefreshIndicator(
                      child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 8.0),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          Category category = categories[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: CategoryItem(
                              img: category.image,
                              name: category.name,
                              category: category,
                            ),
                          );
                        },
                      ),
                      onRefresh: () => tabViewModel.fetchData()));
    });
  }

  @override
  bool get wantKeepAlive => true;
}
