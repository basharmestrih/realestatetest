import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OthersDescriptionRow extends StatelessWidget {
  final String description;

  const OthersDescriptionRow({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
        style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
