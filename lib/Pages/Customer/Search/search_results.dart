import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/search_logic.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/search_logic2.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class SearchResults extends StatefulWidget {
  static const String id = 'search_results';
  @override
  _searchResultsState createState() => _searchResultsState();
}

class _searchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Matched Items',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: SearchLogic(),
    );
  }
}
