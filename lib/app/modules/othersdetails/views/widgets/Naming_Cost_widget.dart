import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OthersTitlePriceRow extends StatelessWidget {
  final String title;
  final int price;

  const OthersTitlePriceRow({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
             style: Theme.of(context).textTheme.titleLarge,
            ),
             Text(price.toString(),
             style: Theme.of(context).textTheme.labelLarge,),
        
      ],
    );
  }
}
