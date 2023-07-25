import 'package:core/core.dart';

import 'package:search/presentation/provider/tv_show_search_notifier.dart';
import 'package:core/presentation/widgets/tv_show_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvShowSearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/tv_show_search';
  const TvShowSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<TvShowSearchNotifier>(context, listen: false)
                    .fetchTvShowSearch(query);
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer<TvShowSearchNotifier>(
              builder: (context, data, child) {
                if (data.state == RequestState.Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.Loaded) {
                  final result = data.searchResult;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final tvShow = data.searchResult[index];
                        return TvShowCard(
                          tvShow: tvShow,
                        );
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
