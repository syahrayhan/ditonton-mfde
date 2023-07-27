import 'package:core/core.dart';

import 'package:core/presentation/widgets/tv_show_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/search_tv/search_tv_bloc.dart';

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
              onChanged: (query) {
                context.read<SearchTvBloc>().add(OnQueryChanged(query));
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
            BlocBuilder<SearchTvBloc, SearchTvState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchHasData) {
                  final result = state.result;

                  if (result.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text("Sorry we can't find any movie or Tv Show"),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final tvShow = state.result[index];
                        return TvShowCard(
                          tvShow: tvShow,
                        );
                      },
                      itemCount: result.length,
                    ),
                  );
                } else if (state is SearchError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text("Search something to find movie"),
                    ),
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
