import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/shows_bloc.dart';

class ShowDetailsPage extends StatelessWidget {
  static const routeName = '/show-details';
  const ShowDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ShowsBloc, ShowsState>(
            builder: (context, state) {
              final show = state.currentShow;

              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.isError) {
                return const Center(child: Text('Error'));
              }

              if (show == null) {
                return const Center(child: Text('No show selected'));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    show.image,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Name: ${show.name}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 20),


                  Text(
                    "Summary: ${show.summary}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),


                  // show Casts Button
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ShowsBloc>().add(ShowsEvent.showCasts(show.id));
                    },
                    child: const Text('Show Casts'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
