import 'package:flutter/material.dart';

class TeamShieldName extends StatelessWidget {
  final String teamName;
  final String imagePath;
  const TeamShieldName({
    super.key,
    required this.teamName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 60,
          ),
          Text(teamName)
        ],
      ),
    );
  }
}
