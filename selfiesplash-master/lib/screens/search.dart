import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: IconButton(onPressed: (){showSearch(context: context, delegate: MySearchDelegate());}, icon: Icon(Icons.search)),
        )
    );
  }
}


class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [];
  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
