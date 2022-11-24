import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cast_entity.dart';
import '../bloc/bloc/shows_bloc.dart';

class CastsPage extends StatelessWidget {
  static const routeName = '/casts';
  const CastsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casts'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ShowsBloc, ShowsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.isError) {
                return const Center(child: Text('Error'));
              }

              final casts = state.casts;
              if (casts.isEmpty) {
                return const Center(child: Text('No casts'));
              }

              return GridView.builder(
                itemCount: state.casts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final cast = state.casts[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ItemCard(cast: cast),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.cast,
  }) : super(key: key);

  final CastEnitity cast;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            cast.image,
            fit: BoxFit.cover,
            height: 200,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            cast.name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
