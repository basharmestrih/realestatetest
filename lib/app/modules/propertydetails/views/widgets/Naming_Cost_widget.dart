import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitlePriceRow extends StatelessWidget {
  final String title;
  final String price;

  const TitlePriceRow({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
             style: Theme.of(context).textTheme.titleLarge,
            ),
        Text(price,
             style: Theme.of(context).textTheme.labelLarge,),
      ],
    );
  }
}
