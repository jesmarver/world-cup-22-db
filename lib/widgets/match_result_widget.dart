import 'package:flutter/material.dart';

class MatchResultWidget extends StatelessWidget {
  final int goalA;
  final int goalB;
  const MatchResultWidget({
    super.key,
    required this.goalA,
    required this.goalB,
  });

  @override
  Widget build(BuildContext context) {
    final tstyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$goalA',
            style: tstyle,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '-',
            style: tstyle,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$goalB',
            style: tstyle,
          ),
        ],
      ),
    );
  }
}
