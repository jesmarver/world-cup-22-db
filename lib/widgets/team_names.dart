import 'package:flutter/material.dart';

class TeamNames extends StatelessWidget {
  final String teamA;
  final String teamB;

  const TeamNames({
    super.key,
    required this.teamA,
    required this.teamB,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          teamA,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const Text(
          'VS',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(
          teamB,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
