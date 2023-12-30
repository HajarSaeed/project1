import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key,required this.label,required this.iconPath});
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset(iconPath),
        ),
        Text(label),
        Spacer(),
        Icon(Icons.arrow_right_outlined)
      ],
    );
  }
}
