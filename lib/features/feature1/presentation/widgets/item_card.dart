import 'package:flutter/material.dart';

import '../../domain/entities/show_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.show,
  }) : super(key: key);

  final ShowEntity show;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            show.image,
            fit: BoxFit.cover,
            height: 200,
          ),
          const SizedBox(height: 5),
          Text(
            show.name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
