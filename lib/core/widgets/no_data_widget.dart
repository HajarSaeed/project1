
import 'package:flutter/material.dart';



class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, required this.onclick, required this.title})
      : super(key: key);

  final VoidCallback onclick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color:Colors.black,
            ),
          ),
          SizedBox(height: 12, width: MediaQuery.of(context).size.width),
          const Icon(
            Icons.replay_circle_filled_rounded,
            color: Colors.orange,
            size: 35,
          ),
        ],
      ),
    );
  }
}
