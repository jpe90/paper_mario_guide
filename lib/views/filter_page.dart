import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../models/collectible.dart';

import 'package:logger/logger.dart' as l;

var logger = l.Logger(printer: l.PrettyPrinter());

// TODO: create a row with three buttons
typedef String NameGetter<T>(T t);
//typedef NameGetter<T> = String Function(T t);

class FilterPage extends StatelessWidget {
  final Level selectedLevel;
  final Category selectedCategory;
  final CompletionStatus selectedCompletionStatus;
  final List<Level> _levels = Level.values;
  final List<Category> _categories = Category.values;
  final List<CompletionStatus> _completionStatuses = CompletionStatus.values;

  const FilterPage(
      {@required this.selectedLevel,
      @required this.selectedCategory,
      @required this.selectedCompletionStatus})
      : assert(selectedLevel != null),
        assert(selectedCompletionStatus != null),
        assert(selectedCategory != null);

  //Widget _createFilterButtonRow(BuildContext context) {
  //  return Row(
  //      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //      children: <Widget>[
  //        RaisedButton(onPressed: () {}, child: Text('Level')),
  //        RaisedButton(onPressed: () {}, child: Text('Type')),
  //        RaisedButton(onPressed: () {}, child: Text('Completion'))
  //      ]);
  //}

  Widget _buildGenericFilter<T>(
      List<T> ts, BuildContext context, NameGetter<T> getDisplayName) {
    return Expanded(
      child: Container(
        //margin: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(width: 2)),
        child: ListView(
            children: ts
                .map((t) => _buildGeneric<T>(t, getDisplayName, context))
                .toList()),
      ),
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
          _buildGenericFilter<Category>(
              _categories, context, Collectible.getDisplayNameForCategory),
          _buildGenericFilter<Level>(
              _levels, context, Collectible.getDisplayNameForLevel),
          _buildGenericFilter<CompletionStatus>(_completionStatuses, context,
              Collectible.getDisplayNameForCompletionStatus)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            alignment: Alignment.topCenter,
            child: _buildRowOfFilters(context),
            color: Colors.blue));
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
