import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldcup22db/services/match_service.dart';
import 'package:worldcup22db/widgets/widgets.dart';

class SearchMatchDelegate extends SearchDelegate {
  SearchMatchDelegate() : super(searchFieldLabel: 'Buscar...');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, ''), icon: Icon(Icons.chevron_left));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = Provider.of<MatchService>(context).findByName(query);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) =>
              MatchCard(matchResult: results[index])),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = Provider.of<MatchService>(context).findByName(query);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) =>
              MatchCard(matchResult: results[index])),
    );
  }
}
