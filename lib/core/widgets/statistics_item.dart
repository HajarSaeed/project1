import 'package:flutter/material.dart';
import '../utils/getsize.dart';

class StatisticsItem extends StatelessWidget {
  final String label;
  final String imagePath;

  const StatisticsItem({super.key,required this.label,required this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: getSize(context)/2.2,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: getSize(context)/14),
            child: Image.asset(imagePath,width: getSize(context)/9,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                const Text("8")
              ],
            ),
          )
        ],
      ),
    );
  }
}
