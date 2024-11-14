import 'package:ecommerce/Color.dart';
import 'package:flutter/material.dart';

class ReuseableText extends StatelessWidget {
  const ReuseableText({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        text: "\$",
        style: textTheme.titleSmall?.copyWith(
          fontSize: 16,
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: price.toString(),
            style: textTheme.titleSmall?.copyWith(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
