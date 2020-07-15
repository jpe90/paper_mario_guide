import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../models/collectible.dart';

import 'package:logger/logger.dart' as l;

var logger = l.Logger(printer: l.PrettyPrinter());

typedef String NameGetter<T>(T t);

class FilterPage extends StatelessWidget {
  final Level selectedLevel;
  final Category selectedCategory;
  final CompletionStatus selectedCompletionStatus;
  final ValueChanged onTap;
  final List<Level> _levels = Level.values;
  final List<Category> _categories = Category.values;
  final List<CompletionStatus> _completionStatuses = CompletionStatus.values;

  const FilterPage({
    @required this.selectedLevel,
    @required this.selectedCategory,
    @required this.selectedCompletionStatus,
    @required this.onTap,
  })  : assert(selectedLevel != null),
        assert(selectedCompletionStatus != null),
        assert(selectedCategory != null),
        assert(onTap != null);

  Widget _buildGenericFilterColumn<T>(
      List<T> ts, BuildContext context, NameGetter<T> getDisplayName) {
    List<Widget> children = [];
    children.add(Text('Title'));
    children.add(SizedBox(
      height: 40,
    ));
    children +=
        ts.map((t) => _buildGeneric<T>(t, getDisplayName, context)).toList();
    var list =
        ts.map((t) => _buildGeneric<T>(t, getDisplayName, context)).toList();
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: children),
    );
  }

  Widget _buildGeneric<T>(
      T t, NameGetter<T> getDisplayName, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        getDisplayName(t),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildRowOfFilters(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildGenericFilterColumn<Category>(
              _categories, context, Collectible.getDisplayNameForCategory),
          VerticalDivider(
            width: 5,
            thickness: 5,
          ),
          _buildGenericFilterColumn<Level>(
              _levels, context, Collectible.getDisplayNameForLevel),
          VerticalDivider(
            width: 5,
            thickness: 5,
          ),
          _buildGenericFilterColumn<CompletionStatus>(_completionStatuses,
              context, Collectible.getDisplayNameForCompletionStatus)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.topCenter,
        //child: _buildRowOfFilters(context),
        child: _buildRowOfFilters(context),
        //child: _buildColumnOfFlatButtons<Category>(
        //    _categories, context, Collectible.getDisplayNameForCategory),
        color: Colors.blue);
  }
}
//Widget build(BuildContext context) {
//  // TODO: implement build
//  return Column(
//    crossAxisAlignment: CrossAxisAlignment.center,
//    children: <Widget>[
//      //Align(
//      //  alignment: Alignment.topCenter,
//      //  child: Container(
//      //      padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
//      //      //child: _buildRow(context),
//      //      child: _createFilterButtonRow(context),
//      //      color: Colors.blue),
//      //),
//      Expanded(
//          child: Container(
//              //child: _buildCategoryFilter(context), color: Colors.blue)),
//              //child: _buildGenericFilter<Category>(_categories, context,
//              //    Collectible.getDisplayNameForCategory),
//              child: Align(
//                  child: _buildRowOfFilters(context),
//                  alignment: Alignment.topCenter),
//              color: Colors.blue)),
//    ],
//  );
//}
