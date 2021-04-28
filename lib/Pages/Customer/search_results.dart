import 'package:flutter/material.dart';
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
          'Search Results',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body:  ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index){
            return Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Row(children: <Widget>[
                            Text("Matched Vendor", style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                          child: Row(children: <Widget>[
                            Text(
                                "Items"),
                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text("Price",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )
                              ),
                              Spacer(),
                              //Icon(Icons.beenhere_outlined),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            );
          },
        ),
    );
  }
}
