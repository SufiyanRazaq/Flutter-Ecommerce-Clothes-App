import 'package:ecommerce/ReuseableText.dart';
import 'package:flutter/material.dart';

class ReuseableRowForCart extends StatelessWidget {
  const ReuseableRowForCart({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  final double price;
  final String text;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: textTheme.headlineSmall?.copyWith(
                  color: const Color.fromARGB(255, 158, 158, 158),
                  fontSize: 14)),
          ReuseableText(
            price: price,
          )
        ],
      ),
    );
  }
}
