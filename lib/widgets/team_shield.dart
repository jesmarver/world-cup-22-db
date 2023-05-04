import 'package:flutter/material.dart';

class TeamShield extends StatelessWidget {
  const TeamShield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/betis.png',
            width: 60,
          ),
        ],
      ),
    );
  }
}
