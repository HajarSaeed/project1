import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key,required this.label,required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(icon),
        Text(label),
        Spacer(),
        Icon(Icons.arrow_right_outlined)
      ],
    );
  }
}
