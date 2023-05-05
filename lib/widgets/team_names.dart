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
    const style = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          teamA,
          style: style,
        ),
        Text(
          teamB,
          style: style,
        ),
      ],
    );
  }
}
