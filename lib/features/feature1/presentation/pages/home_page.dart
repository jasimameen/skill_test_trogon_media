import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/shows_bloc.dart';

import 'package:skill_test_trogon_media/features/feature1/domain/entities/entities.dart';

import '../widgets/item_card.dart';

final dummyShow = ShowEntity(
  id: 1,
  name: 'Show Name',
  image:
      'https://static.tvmaze.com/uploads/images/medium_portrait/205/513325.jpg',
  language: 'English',
  status: 'Ended',
  premiered: '2021-01-01',
  ended: '2021-01-01',
  officialSite: 'https://www.google.com',
  rating: '8.5',
  summary: 'This is a summary',
);

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShowsBloc>().add(const ShowsEvent.fetchAllShows());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('All shows'),
      ),
      // Grid of two showing the shows
      body: BlocBuilder<ShowsBloc, ShowsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError) {
            return const Center(child: Text('Error'));
          }

          return GridView.builder(
            itemCount: state.shows.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final show = state.shows[index];

              return GestureDetector(
                onTap: () {
                  context.read<ShowsBloc>().add(ShowsEvent.showDetais(index));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemCard(show: show),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
