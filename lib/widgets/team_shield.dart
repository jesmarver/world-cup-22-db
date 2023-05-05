import 'package:flutter/material.dart';

class TeamShieldName extends StatelessWidget {
  final String teamName;
  const TeamShieldName({
    super.key,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/$teamName.png',
            width: 60,
          ),
          Text(teamName)
        ],
      ),
    );
  }
}
